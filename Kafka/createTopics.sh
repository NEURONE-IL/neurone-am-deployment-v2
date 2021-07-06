#!/bin/bash


docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic connect-config --config cleanup.policy=compact --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic connect-offset --config cleanup.policy=compact --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic connect-status --config cleanup.policy=compact --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic test.visitedlinks --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic test.bookmarks --if-not-exists
