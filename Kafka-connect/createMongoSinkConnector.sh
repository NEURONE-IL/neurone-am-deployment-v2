#!/bin/bash

# Load variables from .env file
source .env

db_user=${DB_USER:-neurone}
db_host=${DB_HOST:-localhost:27017}
db_name=${DB_NAME:-neurone}
db_password=${DB_PASSWORD:-neur0n3}

curl -X POST http://localhost:28082/connectors -H "Content-Type: application/json" -d '{
    "name": "mongo-sink",
    "config": {
        "connector.class": "com.mongodb.kafka.connect.MongoSinkConnector",
        "tasks.max": 1,
        "connection.uri": "mongodb://'"$db_user"':'"$db_password"'@'"$db_host"'/?authSource='"$db_name"'",
        "database": "'"$db_name"'",
        "topics": "totalcover,bmrelevant,precision,writingtime,pagestay,totalpagestay,ifquotes,firstquerytime,challengestarted",
        "collection": "metrics",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "value.converter.schemas.enable": "false"
    }
}'
