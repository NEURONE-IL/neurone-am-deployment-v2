#!/bin/bash

sudo docker stop ctr_kafka-connect
sudo docker rm ctr_kafka-connect
sudo docker rmi img_kafka-connect


sudo docker build --rm -t img_kafka-connect:latest .

sudo docker run  -d \
--network="host" \
--name ctr_kafka-connect \
-p 28082:28082 \
-e CONNECT_BOOTSTRAP_SERVERS=localhost:9092 \
-e CONNECT_CONFIG_STORAGE_TOPIC="connect-config" \
-e CONNECT_OFFSET_STORAGE_TOPIC="connect-offset" \
-e CONNECT_STATUS_STORAGE_TOPIC="connect-status" \
-e CONNECT_REST_PORT=28082 \
-e CONNECT_REST_ADVERTISED_HOST_NAME="localhost" \
-e CONNECT_GROUP_ID="kafka-connect" \
-e CONNECT_KEY_CONVERTER="org.apache.kafka.connect.storage.StringConverter" \
-e CONNECT_VALUE_CONVERTER="org.apache.kafka.connect.json.JsonConverter" \
-e CONNECT_PLUGIN_PATH=/usr/share/java,/etc/kafka-connect/jars,/usr/share/confluent-hub-components \
img_kafka-connect
