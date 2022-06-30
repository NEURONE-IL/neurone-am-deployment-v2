#!/bin/bash


curl -X POST http://localhost:4004/api/init/docker -H "Content-Type: application/json" -d '
{
    "containers": ["ctn_neurone_pushpin","ctn_neurone_conector","ctn_neurone_coordinator"],
    "interval":10
}
'
