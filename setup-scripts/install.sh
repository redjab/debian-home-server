#!/bin/bash

install_gcp=$1;

# Install docker
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update && sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# Create docker group
if [ ! $(getent group docker) ]; then
    sudo groupadd docker
fi

sudo usermod -aG docker $USER

# Optional: Install Google Cloud SDK
if [ -n "$install_gcp" ]
then 
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    sudo apt-get -y install apt-transport-https ca-certificates gnupg

    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

    sudo apt-get update && sudo apt-get -y install google-cloud-sdk

    sudo gcloud init --console-only
    # Authorize using url from above command
fi

# gsutil cp [OBJECT_LOCATION] gs://unifi-minh

newgrp docker
