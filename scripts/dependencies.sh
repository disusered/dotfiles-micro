#!/bin/bash

if [ -f /etc/redhat-release ]; then
  log "Installing dependencies for RedHat systems"
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ -f /etc/lsb-release ]; then
  log "Installing dependencies for Ubuntu systems"
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
