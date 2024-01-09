#!/bin/bash

read -p "Enter database user (default: neurone): " db_user
db_user=${db_user:-neurone}

read -p "Enter database host (default: localhost:27017): " db_host
db_host=${db_host:-localhost:27017}

read -p "Enter database name (default: neurone): " db_name
db_name=${db_name:-neurone}

read -sp "Enter database password (default: neur0n3): " db_password
db_password=${db_password:-neur0n3}

curl -X POST http://localhost:8000/api/init/s1 -H "Content-Type: application/json" -d '
{
        "probabilityGraph": {
        "Q1": {
            "P1": 0.77,
            "Q2": 0.23,
            "T": 0.0
        },
        "Q1P1": {
            "P2": 0.34,
            "B": 0.52,
            "U": 0.06,
            "Q2": 0.08,
            "T": 0.0
        },
        "Q1P2": {
            "P3": 0.32,
            "B": 0.49,
            "U": 0.11,
            "Q2": 0.09,
            "T": 0.0
        },
        "Q1P3": {
            "P4": 0.33,
            "B": 0.4,
            "U": 0.13,
            "Q2": 0.14,
            "T": 0.0
        },
        "Q1P4": {
            "P5": 0.4,
            "B": 0.34,
            "U": 0.18,
            "Q2": 0.06,
            "T": 0.02
        },
        "Q1P5": {
            "P6": 0.47,
            "B": 0.31,
            "U": 0.14,
            "Q2": 0.08,
            "T": 0.0
        },
        "Q1P6": {
            "Q2": 0.16,
            "B": 0.56,
            "U": 0.26,
            "T": 0.02
        },
        "Q1P1B": {
            "P2": 0.7,
            "U": 0.0,
            "T": 0.0,
            "Q2": 0.3
        },
        "Q1P1U": {
            "P2": 0.9,
            "Q2": 0.1,
            "B": 0.0,
            "T": 0.0
        },
        "Q1P2B": {
            "P3": 0.73,
            "U": 0.0,
            "T": 0.0,
            "Q2": 0.27
        },
        "Q1P2U": {
            "P3": 0.78,
            "Q2": 0.22,
            "B": 0.0,
            "T": 0.0
        },
        "Q1P3B": {
            "P4": 0.75,
            "U": 0.08,
            "T": 0.0,
            "Q2": 0.17
        },
        "Q1P3U": {
            "P4": 0.73,
            "Q2": 0.27,
            "B": 0.0,
            "T": 0.0
        },
        "Q1P4B": {
            "P5": 0.52,
            "U": 0.38,
            "T": 0.0,
            "Q2": 0.11
        },
        "Q1P4U": {
            "P5": 0.83,
            "Q2": 0.17,
            "B": 0.0,
            "T": 0.0
        },
        "Q1P5B": {
            "P6": 0.47,
            "U": 0.38,
            "T": 0.0,
            "Q2": 0.15
        },
        "Q1P5U": {
            "P6": 0.91,
            "Q2": 0.09,
            "B": 0.0,
            "T": 0.0
        },
        "Q1P6B": {
            "Q2": 0.1,
            "T": 0.4,
            "U": 0.5
        },
        "Q1P6U": {
            "Q2": 0.31,
            "T": 0.29,
            "B": 0.4
        },
        "Q2": {
            "P1": 0.73,
            "Q3": 0.27,
            "T": 0.0
        },
        "Q2P1": {
            "P2": 0.37,
            "B": 0.4,
            "U": 0.09,
            "Q3": 0.15,
            "T": 0.0
        },
        "Q2P2": {
            "P3": 0.4,
            "B": 0.38,
            "U": 0.05,
            "Q3": 0.15,
            "T": 0.02
        },
        "Q2P3": {
            "P4": 0.34,
            "B": 0.31,
            "U": 0.14,
            "Q3": 0.19,
            "T": 0.02
        },
        "Q2P4": {
            "P5": 0.42,
            "B": 0.27,
            "U": 0.14,
            "Q3": 0.11,
            "T": 0.06
        },
        "Q2P5": {
            "P6": 0.3,
            "B": 0.4,
            "U": 0.14,
            "Q3": 0.12,
            "T": 0.04
        },
        "Q2P6": {
            "Q3": 0.12,
            "B": 0.56,
            "U": 0.28,
            "T": 0.04
        },
        "Q2P1B": {
            "P2": 0.6,
            "U": 0.13,
            "T": 0.0,
            "Q3": 0.27
        },
        "Q2P1U": {
            "P2": 0.69,
            "Q3": 0.31,
            "B": 0.0,
            "T": 0.0
        },
        "Q2P2B": {
            "P3": 0.53,
            "U": 0.24,
            "T": 0.0,
            "Q3": 0.23
        },
        "Q2P2U": {
            "P3": 0.64,
            "Q3": 0.36,
            "B": 0.0,
            "T": 0.0
        },
        "Q2P3B": {
            "P4": 0.43,
            "U": 0.33,
            "T": 0.0,
            "Q3": 0.25
        },
        "Q2P3U": {
            "P4": 0.62,
            "Q3": 0.29,
            "B": 0.09,
            "T": 0.0
        },
        "Q2P4B": {
            "P5": 0.19,
            "U": 0.73,
            "T": 0.0,
            "Q3": 0.08
        },
        "Q2P4U": {
            "P5": 0.79,
            "Q3": 0.14,
            "B": 0.07,
            "T": 0.0
        },
        "Q2P5B": {
            "P6": 0.39,
            "U": 0.48,
            "T": 0.0,
            "Q3": 0.13
        },
        "Q2P5U": {
            "P6": 0.75,
            "Q3": 0.25,
            "B": 0.0,
            "T": 0.0
        },
        "Q2P6B": {
            "Q3": 0.11,
            "T": 0.5,
            "U": 0.39
        },
        "Q2P6U": {
            "Q3": 0.22,
            "T": 0.5,
            "B": 0.28
        },
        "Q3": {
            "P1": 0.72,
            "Q4": 0.27,
            "T": 0.01
        },
        "Q3P1": {
            "P2": 0.41,
            "B": 0.36,
            "U": 0.11,
            "Q4": 0.12,
            "T": 0.01
        },
        "Q3P2": {
            "P3": 0.34,
            "B": 0.33,
            "U": 0.13,
            "Q4": 0.17,
            "T": 0.03
        },
        "Q3P3": {
            "P4": 0.35,
            "B": 0.34,
            "U": 0.16,
            "Q4": 0.13,
            "T": 0.02
        },
        "Q3P4": {
            "P5": 0.39,
            "B": 0.25,
            "U": 0.15,
            "Q4": 0.17,
            "T": 0.04
        },
        "Q3P5": {
            "P6": 0.44,
            "B": 0.29,
            "U": 0.17,
            "Q4": 0.03,
            "T": 0.07
        },
        "Q3P6": {
            "Q4": 0.08,
            "B": 0.46,
            "U": 0.38,
            "T": 0.08
        },
        "Q3P1B": {
            "P2": 0.44,
            "U": 0.24,
            "T": 0.0,
            "Q4": 0.32
        },
        "Q3P1U": {
            "P2": 0.68,
            "Q4": 0.29,
            "B": 0.03,
            "T": 0.0
        },
        "Q3P2B": {
            "P3": 0.55,
            "U": 0.23,
            "T": 0.0,
            "Q4": 0.22
        },
        "Q3P2U": {
            "P3": 0.64,
            "Q4": 0.32,
            "B": 0.04,
            "T": 0.0
        },
        "Q3P3B": {
            "P4": 0.38,
            "U": 0.47,
            "T": 0.0,
            "Q4": 0.15
        },
        "Q3P3U": {
            "P4": 0.79,
            "Q4": 0.11,
            "B": 0.1,
            "T": 0.0
        },
        "Q3P4B": {
            "P5": 0.28,
            "U": 0.72,
            "T": 0.0,
            "Q4": 0.0
        },
        "Q3P4U": {
            "P5": 0.73,
            "Q4": 0.27,
            "B": 0.0,
            "T": 0.0
        },
        "Q3P5B": {
            "P6": 0.25,
            "U": 0.58,
            "T": 0.0,
            "Q4": 0.17
        },
        "Q3P5U": {
            "P6": 0.71,
            "Q4": 0.14,
            "B": 0.15,
            "T": 0.0
        },
        "Q3P6B": {
            "Q4": 0.08,
            "T": 0.5,
            "U": 0.42
        },
        "Q3P6U": {
            "Q4": 0.01,
            "T": 0.5,
            "B": 0.51
        },
        "Q4": {
            "P1": 0.69,
            "Q5": 0.31,
            "T": 0.0
        },
        "Q4P1": {
            "P2": 0.32,
            "B": 0.42,
            "U": 0.1,
            "Q5": 0.15,
            "T": 0.02
        },
        "Q4P2": {
            "P3": 0.32,
            "B": 0.35,
            "U": 0.13,
            "Q5": 0.17,
            "T": 0.03
        },
        "Q4P3": {
            "P4": 0.38,
            "B": 0.27,
            "U": 0.12,
            "Q5": 0.22,
            "T": 0.02
        },
        "Q4P4": {
            "P5": 0.53,
            "B": 0.26,
            "U": 0.09,
            "Q5": 0.09,
            "T": 0.03
        },
        "Q4P5": {
            "P6": 0.35,
            "B": 0.22,
            "U": 0.17,
            "Q5": 0.13,
            "T": 0.13
        },
        "Q4P6": {
            "Q5": 0.14,
            "B": 0.5,
            "U": 0.21,
            "T": 0.15
        },
        "Q4P1B": {
            "P2": 0.38,
            "U": 0.26,
            "T": 0.0,
            "Q5": 0.36
        },
        "Q4P1U": {
            "P2": 0.5,
            "Q5": 0.45,
            "B": 0.05,
            "T": 0.0
        },
        "Q4P2B": {
            "P3": 0.43,
            "U": 0.3,
            "T": 0.0,
            "Q5": 0.27
        },
        "Q4P2U": {
            "P3": 0.71,
            "Q5": 0.21,
            "B": 0.08,
            "T": 0.0
        },
        "Q4P3B": {
            "P4": 0.44,
            "U": 0.44,
            "T": 0.0,
            "Q5": 0.12
        },
        "Q4P3U": {
            "P4": 0.57,
            "Q5": 0.43,
            "B": 0.0,
            "T": 0.0
        },
        "Q4P4B": {
            "P5": 0.33,
            "U": 0.45,
            "T": 0.0,
            "Q5": 0.22
        },
        "Q4P4U": {
            "P5": 0.67,
            "Q5": 0.33,
            "B": 0.0,
            "T": 0.0
        },
        "Q4P5B": {
            "P6": 0.4,
            "U": 0.4,
            "T": 0.0,
            "Q5": 0.2
        },
        "Q4P5U": {
            "P6": 1.0,
            "Q5": 0.0,
            "B": 0.0,
            "T": 0.0
        },
        "Q4P6B": {
            "Q5": 0.0,
            "T": 1.0,
            "U": 0.0
        },
        "Q4P6U": {
            "Q5": 0.0,
            "T": 1.0,
            "B": 0.0
        },
        "Q5": {
            "P1": 0.72,
            "Q6": 0.27,
            "T": 0.01
        },
        "Q5P1": {
            "P2": 0.36,
            "B": 0.32,
            "U": 0.12,
            "Q6": 0.16,
            "T": 0.04
        },
        "Q5P2": {
            "P3": 0.35,
            "B": 0.32,
            "U": 0.15,
            "Q6": 0.14,
            "T": 0.04
        },
        "Q5P3": {
            "P4": 0.22,
            "B": 0.41,
            "U": 0.14,
            "Q6": 0.18,
            "T": 0.05
        },
        "Q5P4": {
            "P5": 0.36,
            "B": 0.16,
            "U": 0.1,
            "Q6": 0.26,
            "T": 0.12
        },
        "Q5P5": {
            "P6": 0.31,
            "B": 0.31,
            "U": 0.21,
            "Q6": 0.08,
            "T": 0.1
        },
        "Q5P6": {
            "Q6": 0.11,
            "B": 0.56,
            "U": 0.33,
            "T": 0.0
        },
        "Q5P1B": {
            "P2": 0.31,
            "U": 0.44,
            "T": 0.0,
            "Q6": 0.25
        },
        "Q5P1U": {
            "P2": 0.6,
            "Q6": 0.3,
            "B": 0.1,
            "T": 0.0
        },
        "Q5P2B": {
            "P3": 0.33,
            "U": 0.48,
            "T": 0.0,
            "Q6": 0.19
        },
        "Q5P2U": {
            "P3": 0.77,
            "Q6": 0.23,
            "B": 0.0,
            "T": 0.0
        },
        "Q5P3B": {
            "P4": 0.45,
            "U": 0.55,
            "T": 0.0,
            "Q6": 0.0
        },
        "Q5P3U": {
            "P4": 0.71,
            "Q6": 0.14,
            "B": 0.15,
            "T": 0.0
        },
        "Q5P4B": {
            "P5": 0.75,
            "U": 0.25,
            "T": 0.0,
            "Q6": 0.20
        },
        "Q5P4U": {
            "P5": 0.5,
            "Q6": 0.0,
            "B": 0.5,
            "T": 0.0
        },
        "Q5P5B": {
            "P6": 0.25,
            "U": 0.75,
            "T": 0.0,
            "Q6": 0.0
        },
        "Q5P5U": {
            "P6": 1.0,
            "Q6": 0.0,
            "B": 0.0,
            "T": 0.0
        },
        "Q5P6B": {
            "Q6": 0.2,
            "T": 0.5,
            "U": 0.3
        },
        "Q5P6U": {
            "Q6": 0.33,
            "T": 0.5,
            "B": 0.17
        },
        "Q6": {
            "P1": 0.97,
            "T": 0.03
        },
        "Q6P1": {
            "P2": 0.51,
            "B": 0.35,
            "U": 0.09,
            "T": 0.06
        },
        "Q6P2": {
            "P3": 0.51,
            "B": 0.27,
            "U": 0.14,
            "T": 0.08
        },
        "Q6P3": {
            "P4": 0.46,
            "B": 0.28,
            "U": 0.14,
            "T": 0.12
        },
        "Q6P4": {
            "P5": 0.48,
            "B": 0.25,
            "U": 0.15,
            "T": 0.13
        },
        "Q6P5": {
            "P6": 0.52,
            "B": 0.09,
            "U": 0.24,
            "T": 0.15
        },
        "Q6P6": {
            "B": 0.28,
            "U": 0.15,
            "T": 0.57
        },
        "Q6P1B": {
            "P2": 0.57,
            "U": 0.43,
            "T": 0.0
        },
        "Q6P1U": {
            "P2": 0.77,
            "B": 0.23,
            "T": 0.0
        },
        "Q6P2B": {
            "P3": 0.5,
            "U": 0.5,
            "T": 0.0
        },
        "Q6P2U": {
            "P3": 0.93,
            "B": 0.07,
            "T": 0.0
        },
        "Q6P3B": {
            "P4": 0.46,
            "U": 0.54,
            "T": 0.0
        },
        "Q6P3U": {
            "P4": 0.92,
            "B": 0.08,
            "T": 0.0
        },
        "Q6P4B": {
            "P5": 0.53,
            "U": 0.47,
            "T": 0.0
        },
        "Q6P4U": {
            "P5": 0.15,
            "B": 0.85,
            "T": 0.0
        },
        "Q6P5B": {
            "P6": 0.5,
            "U": 0.5,
            "T": 0.0
        },
        "Q6P5U": {
            "P6": 1.0,
            "B": 0.0,
            "T": 0.0
        },
        "Q6P6B": {
            "T": 1.0,
            "U": 0.0
        },
        "Q6P6U": {
            "T": 1.0,
            "B": 0.0
        }
    },
    "random":false,
    "expiration":true,
    "sensibility": 90,
    "interval":500,
    "participantQuantity": 10,
    "documentsQuantity": 10,
    "relevantsQuantity": 3,
    "predefinedUsersIds": [
        "507f1f77bcf86cd799439011",
        "507f191e810c19729de860ea",
        "507f1f77bcf86cd799439012"
    ],
    "queryList": [
        "qué es una \"red\" neuronal?",
        "que es la \"computación cuántica\"",
        "qué es machinelearning",
        "bosques finlandeces",
        "que es netflix",
        "cuál es el mejor libro",
        "cuál es el país más grande de el mundo",
        "google"
    ],
    "database": {
        "databaseName": "'"$db_name"'",
        "databaseUser": "'"$db_user"'",
        "databasePassword": "'"$db_password"'",
        "databaseHost": "'"$db_host"'"
    }
}'
