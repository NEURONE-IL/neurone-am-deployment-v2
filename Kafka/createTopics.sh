#!/bin/bash


docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic connect-config --config cleanup.policy=compact --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic connect-offset --config cleanup.policy=compact --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic connect-status --config cleanup.policy=compact --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic neurone.visitedlinks --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic neurone.bookmarks --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic neurone.queries --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic neurone.keystrokes --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic totalcover --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic bmrelevant --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic precision --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic writingtime --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic pagestay --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic totalpagestay --if-not-exists
docker exec ctr_kafka-broker kafka-topics --create --bootstrap-server localhost:9092 --topic ifquotes --if-not-exists
