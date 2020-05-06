#!/bin/bash

name=$1
email=$2

#Git
git config --global user.name "$name"
git config --global user.email "$email"

# SSH key for GitHub
ssh-keygen -t rsa -b 4096 -C "$email"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub
# Copy content of above command to GitHub

# Start Git
mkdir git
cd git
mkdir debian-home-server
cd debian-home-server

git init
git remote add origin git@github.com:redjab/debian-home-server.git
git checkout -b master
git pull
