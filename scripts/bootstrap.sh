#!/bin/bash

# Root directory for bootstrap scripts
ROOT="${HOME}/.dotfiles/scripts"

# Create pretty logging function
log() {
  echo -e "\033[1;32m[+]\033[0m $1"
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Install Linux dependencies
  source $ROOT/dependencies.sh

  # Install manual dependencies
  source $ROOT/keybase.sh
  source $ROOT/greenclip.sh

  # Symlink configs with stow
  source $ROOT/symlinks.sh

  # Custom configuration scripts
  source $ROOT/shell.sh
  source $ROOT/ssh.sh
fi
