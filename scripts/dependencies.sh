#!/bin/bash

if [ -f /etc/redhat-release ]; then
  echo "Install dependencies for RedHat systems"
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ -f /etc/lsb-release ]; then
  echo "Install dependencies for Ubuntu systems"
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
