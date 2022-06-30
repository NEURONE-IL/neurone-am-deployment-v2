#!/bin/bash


curl -X POST http://localhost:7999/configure -H "Content-Type: application/json" -d '
{
    "metrics":["totalcover","bmrelevant","precision","writingtime","pagestay"],
    "interval":10000,
    "principal":"totalcover",
    "limit":0.5,
    "option":"1"

}
'


curl -X GET http://localhost:7999/init