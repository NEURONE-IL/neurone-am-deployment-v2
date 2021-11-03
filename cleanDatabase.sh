#!/bin/bash

curl -X POST http://localhost:8000/api/clean -H "Content-Type: application/json" -d '
{
    "database": {
        "databaseName": "neurone",
        "databaseUser": "neurone",
        "databasePassword": "neur0n3",
        "databaseHost": "localhost:27018"
    }
}'
