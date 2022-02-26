#!/bin/bash

curl -X POST http://localhost:28082/connectors -H "Content-Type: application/json" -d '{
    "name": "mongo-source",
    "config": {
        "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
        "tasks.max": 1,
        "connection.uri": "mongodb://neurone:neur0n3@159.89.132.126:27017/?authSource=neuronegame",
        "database": "neuronegame",
        "poll.max.batch.size": 1000,
        "poll.await.times.ms": 5000,
        "publish.full.document.only": true,
        "pipeline": "[{\"$match\":{\"ns.coll\":{\"$regex\":/^(visitedlinks|queries)$/}}},{\"$addFields\":{\"fullDocument.userKey\":{\"$toString\":\"$fullDocument.userId\"},\"fullDocument.localTimeStamp\":{\"$toLong\":\"$fullDocument.localTimeStamp\"}}}]",
        "topic.prefix": "neurone",
        "topic.namespace.map": "{\"neuronegame.visitedlinks\":\"visitedlinks\",\"neuronegame.queries\":\"queries\",\"neuronegame.keystrokes\":\"keystrokes\"}",
        "output.schema.infer.value": true,
        "output.format.key": "json",
        "output.format.value": "schema",
        "transforms": "copyIdToKey,extractKeyFromStruct",
        "transforms.copyIdToKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
        "transforms.copyIdToKey.fields": "userKey",
        "transforms.extractKeyFromStruct.type": "org.apache.kafka.connect.transforms.ExtractField$Key",
        "transforms.extractKeyFromStruct.field": "userKey"
    }
}'