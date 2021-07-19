#!/bin/bash

echo "### Stopping coordinator"
sudo docker stop ctr_coordinator
sudo docker rm ctr_coordinator
sudo docker rmi img_coordinator
echo "### Coordinator stope"

echo "### Stopping streaming processor"
sudo docker stop ctr_streaming-processor
sudo docker rm ctr_streaming-processor
sudo docker rmi img_streaming-processor
echo "### Streaming processor stopped"

echo "### Stopping Kafka connect"
sudo docker stop ctr_kafka-connect
sudo docker rm ctr_kafka-connect
sudo docker rmi img_kafka-connect
echo "### Kafka connect stopped"

echo "### Stopping Kafka broker"
sudo docker stop ctr_kafka-broker
sudo docker rm ctr_kafka-broker
echo "### Kafka broker stopped"

echo "### Stopping Zookeeper"
sudo docker stop ctr_zookeeper
sudo docker rm ctr_zookeeper
echo "### Zookeper stopped"

echo "### Stopping Pushpin ###"
sudo docker stop ctn_neurone_pushpin
sudo docker rm ctn_neurone_pushpin


echo "#### NEURONE AM Stopped"