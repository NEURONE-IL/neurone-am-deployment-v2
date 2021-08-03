#!/bin/bash
echo "Init reset script!"
echo "### Stopping streaming processor"
sudo docker stop ctr_streaming-processor
sudo docker rm ctr_streaming-processor
sudo docker rmi img_streaming-processor
echo "### Streaming processor stopped"

echo "### Deleting connector"
curl -X PUT http://localhost:28082/connectors/mongo-source/pause

curl -X DELETE http://localhost:28082/connectors/mongo-source
echo "### Connector deleted"


echo "Deleting topics"
docker exec ctr_kafka-broker kafka-topics --delete --bootstrap-server localhost:9092 --topic neurone.visitedlinks --if-exists
docker exec ctr_kafka-broker kafka-topics --delete --bootstrap-server localhost:9092 --topic neurone.bookmarks --if-exists
docker exec ctr_kafka-broker kafka-topics --delete --bootstrap-server localhost:9092 --topic connect-config --if-exists
docker exec ctr_kafka-broker kafka-topics --delete --bootstrap-server localhost:9092 --topic connect-offset --if-exists
docker exec ctr_kafka-broker kafka-topics --delete --bootstrap-server localhost:9092 --topic connect-status --if-exists
echo "Topics deleted"

echo "Clean environment"
docker exec ctr_kafka-broker kafka-streams-application-reset --application-id totalcover-application


echo "Creating topics again"
./Kafka/createTopics.sh

sleep 10
./Kafka-connect/createMongoConnector.sh

echo "Init streaming processor again"
cd neurone-streaming-processor

./runDocker.sh
cd ..

echo "## Environment reset!"
