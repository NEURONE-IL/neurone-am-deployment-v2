#!/bin/bash

sudo docker stop ctr_kafka-broker
sudo docker rm ctr_kafka-broker

sudo docker run  -d \
--network="host" \
--name=ctr_kafka-broker \
-p 9092:9092 \
-e KAFKA_BROKER_ID=2 \
-e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
-e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
-e KAFKA_ZOOKEEPER_CONNECT=localhost:2181 \
confluentinc/cp-kafka:6.2.0