#!/bin/bash

# Clone FZF from Git if it hasn't been fetched yet
if [ ! -d ~/.fzf ]; then
  log "Cloning FZF"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
else
  # Else update the repository
  log "Updating FZF"
  cd ~/.fzf && git pull
fi

# Install FZF command is not already installed
if ! [ -x "$(command -v fzf)" ]; then
  log "Installing FZF"
  ~/.fzf/install
fi
