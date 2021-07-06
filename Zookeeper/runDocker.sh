#!/bin/bash

sudo docker stop ctr_zookeeper
sudo docker rm ctr_zookeeper

sudo docker run  -d \
--network="host" \
--name ctr_zookeeper \
-p 2181:2181 \
-e ZOOKEEPER_CLIENT_PORT=2181 \
-e ZOOKEEPER_TICK_TIME=2000 \
-e ZOOKEEPER_SYNC_LIMIT=2 \
confluentinc/cp-zookeeper:6.2.0