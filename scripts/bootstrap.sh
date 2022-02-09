#!/bin/bash

ROOT="${HOME}/.dotfiles/scripts"

# Create pretty logging function
log() {
  echo -e "\033[1;32m[+]\033[0m $1"
}

case $(uname) in
  'Linux')
    source $ROOT/dependencies.sh
    source $ROOT/keybase.sh
    source $ROOT/symlinks.sh
    source $ROOT/ssh.sh
    ;;
  'Darwin')
    # TODO
    # source $ROOT/macos
    # source $ROOT/dependencies
    ;;
esac
