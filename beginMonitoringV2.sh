#!/bin/bash


curl -X POST http://localhost:4004/api/init/docker -H "Content-Type: application/json" -d '
{
    "containers": ["ctn_neurone_pushpin","ctr_coordinator","ctr_kafka-broker","ctr_kafka-connect","ctr_streaming-processor","ctr_zookeeper"],
    "interval":10
}
'


curl -X POST http://localhost:4004/api/init/kafka?option=1 -H "Content-Type: application/json" -d '
{
    "kafkaUrl":"http://localhost:7070/metrics",
    "interval":10
}
'