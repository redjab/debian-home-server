#!/bin/bash

# as root
apt-get update

su -

usermod -aG sudo redjab

su redjab

# SSH Server
sudo apt-get -y install openssh-server