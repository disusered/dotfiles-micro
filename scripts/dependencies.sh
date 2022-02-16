#!/bin/bash

if [ "$DISTRO" == "redhat" ]; then
  log "Installing dependencies for RedHat systems"
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ "$DISTRO" == "ubuntu" ]; then
  log "Installing dependencies for Ubuntu systems"
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
