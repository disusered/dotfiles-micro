#!/bin/bash

# Install Volta if not already installed
if [ ! -f /usr/local/bin/volta ]; then
  echo "Installing Volta for Node"
  curl https://get.volta.sh | bash -s -- --skip-setup
fi
