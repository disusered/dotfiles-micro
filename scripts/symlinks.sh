#!/bin/bash

cd "$HOME/.dotfiles/configs" || exit

log "Installing dotfiles"
stow git
