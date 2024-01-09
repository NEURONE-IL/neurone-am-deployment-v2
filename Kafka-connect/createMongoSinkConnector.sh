#!/bin/bash

read -p "Enter database user (default: neurone): " db_user
db_user=${db_user:-neurone}

read -p "Enter database host (default: localhost:27017): " db_host
db_host=${db_host:-localhost:27017}

read -p "Enter database name (default: neurone): " db_name
db_name=${db_name:-neurone}

read -sp "Enter database password (default: neur0n3): " db_password
db_password=${db_password:-neur0n3}


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
