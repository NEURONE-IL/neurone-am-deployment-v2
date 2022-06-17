# Despliegue NEURONE AM V2  

Este repositorio tiene como finalidad facilitar el despliegue de NEURONE AM V2.Por lo tanto, a continuación se describen los pasos para poder realizar el despliegue de cada uno de los componentes que lo conforman utilizando los script provistos. Esto principalmente pensando en un ambiente de producción soportado por Docker.



## Configuración base de datos

NEURONE AM debe ser capaz de conectarse a la instancia de MongoDB en la cual se almacenan las interacciones de los estudiantes que llevan a cabo tareas en las diferentes plataformas de NEURONE. Dicha base de datos debe cumplir ciertos requerimientos para que NEURONE AM pueda detectar en tiempo real los datos que van siendo añadidos. Específicamente:

- Acceso remoto: Para que la instancia desplegada de NEURONE AM pueda leer los datos, la instancia de mongo DB debe permitir el acceso remoto desde el servidor en el que se encuentre desplegado. Es decir, permitir solo el acceso por Shh tunnel no es suficiente.
- Modo replica set: Una de las condiciones para que NEURONE AM pueda detectar en tiempo real y de forma progresiva los cambios que va teniendo la base de datos corresponde a que esta se encuentre desplegada en modo Replica Set y no Standalone, el cual viene por defecto a la hora de instalar. Esto se debe a que en el modo Replica Set la instancia de mongoDB cuenta con una colección de logs específica que lleva el registro de todas las modificaciones de inserción que han sufrido las otras colecciones. Dicho registro es usado internamente por NEURONE AM para ir detectando los nuevos datos asociados a los estudiantes en tiempo real.
- Versión 4.0-4.4: Una limitación que existe actualmente, corresponde al hecho de que NEURONE AM puede interactuar de forma correcta con una versión de MongoDB que se encuentre entre la 4.0 y la 4.4, siendo esta última la recomendada por ahora. Esto se debe a que en las versiones más actuales existen ciertas diferencias en la forma en como se maneja la seguridad. Idealmente, en el futuro NEURONE AM deberia soportar la última versión de MongoDB.


A continuación se describen los pasos a seguir para poder hacer una instalación de una instancia de MongoDB con las condiciones descritas anteriormente en un servidor con Ubuntu 20.04 LTS:

* Instalar la versión 4.4 de MongoDB siguiendo los pasos descritos en la documentación oficial: https://www.mongodb.com/docs/v4.4/tutorial/install-mongodb-on-ubuntu/. Específicamente, en el paso 4, seleccionar la opción **Install a specific release of MongoDB**.

* Luego de verificar que la instalación se llevó a cabo correctamente, crear un usuario con rol de administrador en la base de datos **admin** de mongo:
   * Ingresar a la consola de mongo con el comando ```sudo mongod ```
   * ```use admin```
   * ```javascript 
       db.createUser({
       "user": "neuroneAdmin",
       "pwd": "<contraseña>",
       "roles":[
           {"role":"userAdminAnyDatabase","db":"admin"},
           {"role":"clusterAdmin","db":"admin"},
           "readWriteAnyDatabase"
       ]})```
* Posteriormente, crear un usuario en la/las base dedatos en las cuales se almacenan los datos asociados a los estudiantes. Por ejemplo, asumiendo que la base de datos sea **neurone**:
   * ```javascript
       db.createUser({
           "user":"neuroneUser",
           "pwd":"<contraseña">,
           "roles":[
               {"role":"readWrite","db":"neurone"}
           ]
       })
       ```
* A continuación, habilitar la autenticación en mongo. Para esto se debe acceder al archivo de configuración general, el cual suele encontrase en **/etc/mongod.conf** o **/etc/mongo.conf**.
    * En la sección de security,  modificar el campo **authorization** con el valor **enabled**.
* Al mismo tiempo que el paso anterior, habilitar acceso remoto a la base de datos, modificando el campo **bindIp** en la sección **net** con el valor **0.0.0.0**.

* Aun con el archivo de configuración, activar el modo replica set y modificar agregar un **Keyfile** para realizar la autenticación local (esto es un requerimiento para el modo replica set):
    * En el archivo de configuración, agregar la sección **replication** y luego el campo **replSetName** con el nombre asociado a la instancia, tal como se ilustra a continuación:

    ```
        replication:
            replSetName: <replicaSetName>
    ```

    * En la misma línea, crear un Keyfile con los siguientes comandos: 
    ```
    openssl rand -base64 756 > <path-to-keyfile>
    chmod 400 <path-to-keyfile>

    ```
    * Luego, en el archivo de configuración indicar la ruta del archivo keyfile, añadiendo un nuevo campo en la sección security con el nombre de **keyFile**. Dicho campo debe contener la ruta:
    ```
    security:
        keyFile: <path-to-keyfile>
    replication:
        replSetName: <replicaSetName>
    ```
* Reiniciar la instancia de MongoDB
* Luego del reinicio, en caso de que no exista algún error, ingresar a la consola al igual que el caso anterior.
* Acceder a la base de datos **admin**
* Autenticarse en la base de datos con el comando **db.auth("username","password").
* Ejecutar el comando ```rs.initiate()```
* Finalmente, ejecutar el comando ```rs.status()``` para vierificar que todo funciono correctamente.
* Luego de seguir todos estos pasos, la base de datos ya habra quedado configurada en modo replicaSet, con una replica activa.



## Estructura de despliegue

Con ayuda del script provisto en este repositorio se pueden desplegar los 6 componentes que permiten el correcto funcionamiento de NEURONE AM. Cada uno de dichos componentes queda desplegado con su respectivo contenedor docker. Así mismo, algunos de estos poseen diferentes archivos de configuración que deben ser modificados dependiendo del caso. A continuación se describe de forma breve el rol de cada componente:

* Kafka-connect:
    * Nombre contenedor: ctr_kafka-connect
    * Corresponde a una instancia de Kafka Connect, la cual permite detectar y obtener en tiempo real los datos de la base de datos a medida que estos se van insertando. Luego, dichos datos son almacenados en los canales del Broker de Kafka.
* Kafka-broker: 
    * Nombre contenedor: ctr_kafka-broker
    * Componente central de la infraestructura, el cual permite implementar el patrón publish-subscriber y se encarga de proveer diferentes canales desde los cuales los datos en bruto y las métricas pueden ser consumidos.
* Zookeper:
    * Nombre contenedor: ctr_zookeper.
    * Componente que utiliza el broker de kafka por defecto para guardar las configuraciones asociados a esto y coordinar diferentes réplicas del mismo broker si se despliega de forma distribuida. En las nuevas versiones de Kafka, este componente ya no es requerido, puesto que se está trabajando en un mecanismo de coordinación propio de los brokers entre sí.
* Streaming-processor:
    * Nombre contenedor: ctr_streaming-processor
    * Componente que permite llevar a cabo el procesamiento de las métricas en tiempo real a través de un enfoque de procesamiento streaming. Se encuentra desarrollado en java y utiliza la biblioteca Kafka Streaming para soportar dicho procesamiento. A diferencia de los componentes descritos anteriormente, este posee su propio repositorio y Dockerfile para la construcción del contenedor. Se conecta al broker de kafka.
* Coordinator V2: 
    * Nombre contenedor: ctr_coordinator
    * Corresponde a una versión mejorada del coordinador, cuyo principal rol es hacer la entrega de las métricas calculadas y almacenadas en los canales del broker. Además, soporta la creación de múltiples configuraciones para que diferentes clientes puedan realizar el consumo de métricas de acuerdo a sus requerimientos. Al igual que straming-processor posee su propio repositorio con el archivo Dockerfile para el montaje del contenedor. Se encuentra implementado en Java con el framework spring-boot. Seria recomendable hacer un refactor de este componente con herramientas menos complejas y más pequeñas, dado las fucniones que tiene.
* Pushpin: 
    * Nombre contenedor:  ctn_neurone_pushpin
    * Componente que funciona como un proxy que permite realizar una separación entre el coordinador y aquellos clientes que deseen interactuar con este. Específicamente, permite que el coordinador se abstraiga de la implementación de SSE y Websocket para la entrega de datos en tiempo real y de forma progresiva.
