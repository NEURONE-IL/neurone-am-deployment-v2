#!/bin/bash

curl -X POST http://localhost:28082/connectors -H "Content-Type: application/json" -d '{
    "name": "mongo-source",
    "config": {
        "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
        "tasks.max": 1,
        "connection.uri":"mongodb://neuroneAdmin:DK%2CV-Dk6-*Pd-PM@localhost:27017/?authSource=admin",
        "database": "neuronegame",
        "poll.max.batch.size": 1000,
        "poll.await.times.ms": 5000,
        "publish.full.document.only": true,
        "pipeline": "[{\"$match\":{\"ns.coll\":{\"$regex\":/^(visitedlinks|queries|bookmarks|keystrokes|events)$/}}}, {\"$match\": {\"fullDocument.userId\": {\"$exists\": true}}}, {\"$addFields\": {\"fullDocument.userId\": {\"$toString\": \"$fullDocument.userId\"}}}]",
        "topic.prefix": "neurone",
        "topic.namespace.map": "{\"neuronegame.visitedlinks\":\"visitedlinks\",\"neuronegame.queries\":\"queries\",\"neuronegame.keystrokes\":\"keystrokes\",\"neuronegame.events\":\"events\"}",
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
