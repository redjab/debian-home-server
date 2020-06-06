#!/bin/bash

cd /persist

mkdir mosquitto 
mkdir mosquitto/config/ 
mkdir mosquitto/data/
mkdir mosquitto/log/

touch mosquitto/config/mosquitto.conf

cat > /persist/mosquitto/config/mosquitto.conf <<- EOM
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
EOM
