#!/bin/bash

email=$1

#Git
sudo apt-get -y install git

sudo apt-get -y install keychain

# Force config file creation
git config --edit --global

git config --global user.name "$USER"
git config --global user.email "$email"

# SSH key for GitHub
ssh-keygen -t rsa -b 4096 -C "$email"

eval "$(ssh-agent -s)"

ssh-add $HOME/.ssh/id_rsa

echo 'eval `keychain --eval id_rsa`' >> $HOME/.bashrc

cat $HOME/.ssh/id_rsa.pub
# Copy content of above command to GitHub

read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

# Start Git
rm -rf git
mkdir git
cd git
mkdir debian-home-server
cd debian-home-server
git init
git remote add origin git@github.com:redjab/debian-home-server.git
git fetch
git checkout master

mkdir -p /persist/home-assistant
git init
git remote add origin git@github.com:redjab/home-assistant.git
git fetch
git checkout master
