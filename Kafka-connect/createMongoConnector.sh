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
    "name": "mongo-source",
    "config": {
        "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
        "tasks.max": 1,
        "connection.uri": "mongodb://'"$db_user"':'"$db_password"'@'"$db_host"'/?authSource='"$db_name"'",
        "database": "'"$db_name"'",
        "poll.max.batch.size": 1000,
        "poll.await.times.ms": 5000,
        "publish.full.document.only": true,
        "pipeline": "[{\"$match\":{\"ns.coll\":{\"$regex\":/^(visitedlinks|queries|bookmarks|keystrokes|events)$/}}}, {\"$match\": {\"fullDocument.userId\": {\"$exists\": true}, \"fullDocument.studyId\": {\"$exists\": true}}}, {\"$addFields\": {\"fullDocument.userId\": {\"$toString\": \"$fullDocument.userId\"}, \"fullDocument.studyId\": {\"$toString\": \"$fullDocument.studyId\"}}}]",
        "output.schema.infer.value": true,
        "output.format.key": "json",
        "output.format.value": "schema",
        "transforms": "copyIdToKey,extractKeyFromStruct",
        "transforms.copyIdToKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
        "transforms.copyIdToKey.fields": "userId",
        "transforms.extractKeyFromStruct.type": "org.apache.kafka.connect.transforms.ExtractField$Key",
        "transforms.extractKeyFromStruct.field": "userId"
    }
}'
