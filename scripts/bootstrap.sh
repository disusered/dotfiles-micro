#!/bin/bash

ROOT="${HOME}/.dotfiles/scripts"

# Create pretty logging function
log() {
  echo -e "\033[1;32m[+]\033[0m $1"
}

case $(uname) in
  'Linux')
    # Install Linux dependencies
    source $ROOT/dependencies.sh
    source $ROOT/keybase.sh

    # Symlink configs with stow
    source $ROOT/symlinks.sh

    # Custom configuration scripts
    source $ROOT/shell.sh
    source $ROOT/ssh.sh
    ;;
  'Darwin')
    # TODO
    # source $ROOT/macos
    # source $ROOT/dependencies
    ;;
esac
