#!/bin/bash

# Install OpenSSH Server
if [ -f /etc/redhat-release ]; then
  sudo dnf install -y openssh-server
elif [ -f /etc/lsb-release ]; then
  sudo apt-get install -y openssh-server
fi

# Start SSH service
sudo systemctl enable sshd.service --now

# Create SSH directory
mkdir -p ~/.ssh

# Set permissions on SSH directory
chmod 755 ~/.ssh

# Create an authorized_keys file
touch ~/.ssh/authorized_keys

# Set permissions on authorized_keys file
chmod 644 ~/.ssh/authorized_keys
