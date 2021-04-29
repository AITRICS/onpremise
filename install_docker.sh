#!/bin/bash

apt-get update  || { echo 'failed' ; exit 1; }

apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  || { echo 'failed' ; exit 1; }

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg  || { echo 'my_command failed' ; exit 1; }

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
  || { echo 'failed' ; exit 1; }

apt-get update || { echo 'failed' ; exit 1; }
apt-get install docker-ce docker-ce-cli containerd.io || { echo 'failed' ; exit 1; }
