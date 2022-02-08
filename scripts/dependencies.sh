#!/bin/bash

if [ -f /etc/redhat-release ]; then
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ -f /etc/lsb-release ]; then
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
