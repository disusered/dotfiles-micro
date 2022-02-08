#!/bin/bash

ROOT="${HOME}/.dotfiles/scripts"

case $(uname) in
  'Linux')
    source $ROOT/dependencies.sh
    source $ROOT/ssh.sh
    ;;
  'Darwin')
    # TODO
    # source $ROOT/macos
    # source $ROOT/dependencies
    ;;
esac
