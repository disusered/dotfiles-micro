#!/bin/bash

# Sources
# https://docs.fedoraproject.org/en-US/Fedora/14/html/Deployment_Guide/s2-ssh-configuration-keypairs.html
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

EMAIL="crosquillas@gmail.com"

# Start SSH service
sudo systemctl enable sshd.service --now

# Create a new SSH key
ssh-keygen -t ed25519 -C "$EMAIL" -N "" -C "GitHub Key" -f ~/.ssh/id_ed25519

# Set permissions on SSH directory
chmod 755 ~/.ssh

# Create an authorized_keys file
touch ~/.ssh/authorized_keys

# Set permissions on authorized_keys file
chmod 644 ~/.ssh/authorized_keys

# Start SSH Agent in background
eval "$(ssh-agent -s)"

# Add SSH key to SSH Agent
ssh-add ~/.ssh/id_ed25519
