#!/bin/bash

# Sources
# https://docs.fedoraproject.org/en-US/Fedora/14/html/Deployment_Guide/s2-ssh-configuration-keypairs.html
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

EMAIL="crosquillas@gmail.com"

log "Start SSH service"
sudo systemctl enable sshd.service --now
systemctl status sshd.service --lines 0

if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "Create SSH key with ed25519 algorithm"
  ssh-keygen -t ed25519 -C "$EMAIL" -N "" -C "GitHub Key" -f ~/.ssh/id_ed25519

  log "Set permissions on SSH directory"
  chmod 755 ~/.ssh
fi

if [ ! -f ~/.ssh/authorized_keys ]; then
  log "Create or touch authorized_keys file"
  touch ~/.ssh/authorized_keys

  log "Set permissions on authorized_keys file"
  chmod 644 ~/.ssh/authorized_keys
fi

log "Start SSH Agent"
eval "$(ssh-agent -s)"

log "Add SSH key to SSH Agent"
ssh-add ~/.ssh/id_ed25519
