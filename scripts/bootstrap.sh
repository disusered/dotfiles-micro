#!/bin/bash

# Root directory for bootstrap scripts
ROOT="${HOME}/.dotfiles/scripts"

# Set environment variables required by bootstrap scripts
if [ -f /etc/redhat-release ]; then
  DISTRO="redhat"
elif [ -f /etc/lsb-release ]; then
  DISTRO="ubuntu"
fi

if [ "$(uname)" == 'Darwin' ]; then
  OS="mac"
elif [ "$(uname)" == 'Linux' ]; then
  OS="linux"
fi

# Create pretty logging function
log() {
  echo -e "\033[1;32m[+]\033[0m $1"
}

# Bootstap the system
# TODO
# if [ "$OS" == "mac" ]; then
  # source $ROOT/macos
if [ "$OS" == "linux" ]; then
  # Install Linux dependencies
  source $ROOT/dependencies.sh
  source $ROOT/keybase.sh

  # Install manual dependencies
  source $ROOT/greenclip.sh

  # Symlink configs with stow
  source $ROOT/symlinks.sh

  # Custom configuration scripts
  source $ROOT/shell.sh
  source $ROOT/ssh.sh
fi
