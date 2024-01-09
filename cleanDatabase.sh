#!/bin/bash

read -p "Enter database user (default: neurone): " db_user
db_user=${db_user:-neurone}

read -p "Enter database host (default: localhost:27017): " db_host
db_host=${db_host:-localhost:27017}

read -p "Enter database name (default: neurone): " db_name
db_name=${db_name:-neurone}

read -sp "Enter database password (default: neur0n3): " db_password
db_password=${db_password:-neur0n3}

curl -X POST http://localhost:8000/api/clean -H "Content-Type: application/json" -d '
{
    "database": {
        "databaseName": "'"$db_name"'",
        "databaseUser": "'"$db_user"'",
        "databasePassword": "'"$db_password"'",
        "databaseHost": "'"$db_host"'"
    }
}'
