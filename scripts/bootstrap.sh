#!/bin/bash

ROOT="${HOME}/.dotfiles/scripts"

case $(uname) in
  'Linux')
    source $ROOT/dependencies
    source $ROOT/ssh
    ;;
  'Darwin')
    # TODO
    # source $ROOT/macos
    # source $ROOT/dependencies
    ;;
esac
