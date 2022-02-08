#!/bin/bash

# Install OpenSSH Server
sudo dnf install -y openssh-server

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
