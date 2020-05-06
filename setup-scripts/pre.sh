#!/bin/bash

apt-get update

# SSH Server
apt-get -y install openssh-server

service ssh start
