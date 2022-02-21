#!/bin/bash

# Enable Docker and start
# https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot
sudo systemctl enable docker.service --now
sudo systemctl enable containerd.service --now

# Allow using Docker without sudo
# https://docs.docker.com/engine/install/linux-postinstall/

# Create docker group
sudo groupadd docker

# Add user to docker group
sudo usermod -aG docker $USER
