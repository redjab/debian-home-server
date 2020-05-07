#!/bin/bash

name=$1
email=$2

#Git
apt-get -y install git

git config --global user.name "$name"
git config --global user.email "$email"

# SSH key for GitHub
sudo -u $name ssh-keygen -t rsa -b 4096 -C "$email"

eval "$(ssh-agent -s)"

ssh-add /home/$name/.ssh/id_rsa

cat /home/$name/.ssh/id_rsa.pub
# Copy content of above command to GitHub

read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

# Start Git
sudo -u $name mkdir git
cd git
sudo -u $name mkdir debian-home-server
cd debian-home-server
sudo -u $name git init
sudo -u $name git remote add origin git@github.com:redjab/debian-home-server.git
sudo -u $name git fetch
sudo -u $name git checkout master