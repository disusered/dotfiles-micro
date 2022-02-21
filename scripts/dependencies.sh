#!/bin/bash

# If redhat/fedora, else if ubuntu
if [ -f /etc/redhat-release ]; then
  log "Installing dependencies for RedHat systems"
  sudo dnf copr enable atim/lazygit -y
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ -f /etc/lsb-release ]; then
  log "Installing dependencies for Ubuntu systems"
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
