#!/bin/bash

user=$1
pass=$2
host="github.com/javier322"
read -p "  github user: " user
read -s -p "  github pass: " pass

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
sleep 10
echo "#Initials topics creation"
./createTopics.sh
echo "Broker and topic created"
cd ..
echo "## Init Kafka Connect"
cd Kafka-connect
./runDocker.sh
sleep 30
echo "# Create mongo connector"
./createMongoConnector.sh
echo "## Kafka-connect created"
cd ..
echo "## Cloning Kafka-processor repository"
git clone  "https://$user:$pass@$host/neurone-streaming-processor.git"
cd neurone-streaming-processor
echo "## Init Kafka processor"
./runDocker.sh
sleep 10
echo "##Kafka processor created"

cd ..
echo "## Cloning Neurone am Coordinador v2"
git clone "https://$user:$pass@$host/neurone-am-coordinator-v2.git"
cd neurone-am-coordinator-v2
echo "## Init neurone am coordinator v2"
./runDocker.sh
cd ..
echo "###NEURONE AM V2 is Ready"

