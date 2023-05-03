#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
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

    # Install to XDG_CONFIG_HOME if available
    if [ -d "$XDG_CONFIG_HOME" ]; then
      ~/.fzf/install --xdg --all --no-bash --no-fish --no-zsh
    else
      ~/.fzf/install --all --no-bash --no-fish --no-zsh
    fi
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  log "Installing FZF shell utilities"
  $(brew --prefix)/opt/fzf/install --all --no-bash --no-fish --no-zsh
fi
