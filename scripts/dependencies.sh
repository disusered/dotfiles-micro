#!/bin/bash

if [ -f /etc/redhat-release ]; then
  sudo dnf install -y $(cat packages/dnf)
elif [ -f /etc/lsb-release ]; then
  sudo apt-get install -y $(cat packages/apt)
fi
