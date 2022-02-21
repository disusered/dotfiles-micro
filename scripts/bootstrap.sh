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
  source $ROOT/rust.sh
  source $ROOT/keybase.sh
  source $ROOT/greenclip.sh
  source $ROOT/shell.sh
  source $ROOT/tmux.sh
  source $ROOT/ssh.sh
  source $ROOT/fzf.sh
  source $ROOT/neovim.sh

  # Symlink configs with stow
  source $ROOT/symlinks.sh
fi
