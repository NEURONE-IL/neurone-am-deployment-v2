#!/bin/bash

# Load variables from .env file
source .env

db_user=${DB_USER:-neurone}
db_host=${DB_HOST:-localhost:27017}
db_name=${DB_NAME:-neurone}
db_password=${DB_PASSWORD:-neur0n3}


curl -X POST http://localhost:8000/api/clean -H "Content-Type: application/json" -d '
{
    "database": {
        "databaseName": "'"$db_name"'",
        "databaseUser": "'"$db_user"'",
        "databasePassword": "'"$db_password"'",
        "databaseHost": "'"$db_host"'"
    }
}'
