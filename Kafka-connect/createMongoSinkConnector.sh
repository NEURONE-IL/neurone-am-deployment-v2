#!/bin/bash

curl -X POST http://localhost:28082/connectors -H "Content-Type: application/json" -d '{
    "name": "mongo-sink",
    "config": {
        "connector.class": "com.mongodb.kafka.connect.MongoSinkConnector",
        "tasks.max": 1,
        "connection.uri": "mongodb://neurone:neur0n3@localhost:27017/?authSource=neurone",
        "database": "neurone",
        "topics": "totalcover,bmrelevant,precision,writingtime,pagestay,totalpagestay,ifquotes,firstquerytime,challengestarted",
        "collection": "metrics",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "value.converter.schemas.enable": "false"
    }
}'
