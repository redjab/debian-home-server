#!/bin/bash

PIHOLE_WEBPASSWORD=$1 PUID=$(id -u) PGID=$(getent group $USER | awk -F: '{printf "%d\n", $3}') docker-compose up
