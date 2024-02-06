#!/bin/bash

# Load variables from .env file
source .env

echo "##### Init neurone AM deployment"

echo "## Init Zookeeper deployment"

cd Zookeeper
./runDocker.sh
sleep 10
cd ..

echo "## Zookeper Docker ready"

echo "## Init Kafka broker "
cd Kafka
./runDocker.sh
sleep 30
echo "#Initials topics creation"
./createTopics.sh
echo "Broker and topic created"
cd ..
echo "## Init Kafka Connect"
cd Kafka-connect
./runDocker.sh
sleep 60
echo "# Create mongo connector"
./createMongoConnector.sh  

echo "# Create mongo sink connector"
./createMongoSinkConnector.sh  
echo "## Kafka-connect created"

cd ..
echo "## Cloning Kafka-processor repository"
sudo rm -r neurone-streaming-processor
git clone https://"$GITHUB_USER":"$GITHUB_PASS"@github.com/NEURONE-IL/neurone-streaming-processor.git
cd neurone-streaming-processor
echo "## Init Kafka processor"
./runDocker.sh
sleep 10
echo "##Kafka processor created"

cd ..
echo "## Cloning Neurone am Coordinador v2"
sudo rm -r neurone-am-coordinator-v2
git clone https://"$GITHUB_USER":"$GITHUB_PASS"@github.com/NEURONE-IL/neurone-am-coordinator-v2.git
cd neurone-am-coordinator-v2
echo "## Init neurone am coordinator v2"
./runDocker.sh
cd ..

cd pushpin
./runDocker.sh
cd ..
echo "## Init pushpin"

echo "###NEURONE AM V2 is Ready"

