#!/bin/bash
IP=${HOST}
PORT='8080'
ADDR=${EUREKA_CORE_URL}
SERVICE=`curl -s ${ADDR}apps |grep -B 2 "<instanceId>${IP}:8080" |head -1 |awk -F"[<>]" '{print $3}'`
curl --request PUT  --url ${ADDR}apps/${SERVICE}/${IP}:${PORT}/status?value=OUT_OF_SERVICE
sleep 60
