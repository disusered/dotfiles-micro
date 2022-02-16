#!/bin/bash

# https://www.gnu.org/software/stow/manual/html_node/Invoking-Stow.html

STOW_DIR="~/.dotfiles/configs"

log "Installing dotfiles"
stow -d ~/.dotfiles/ -R git .local zsh
