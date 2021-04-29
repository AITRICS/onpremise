#!/bin/bash

sudo apt-get update && sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  || { echo 'apt install failed' ; exit 1; }

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg || { echo 'adding key failed' ; exit 1; }

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
  || { echo 'adding docker to sources list failed' ; exit 1; }

sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io || { echo 'installation failed' ; exit 1; }

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose || { echo 'get docker-compose failed' ; exit 1; }
