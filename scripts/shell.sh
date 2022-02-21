#!/bin/sh

# Set default shell to zsh
sudo chsh -s $(which zsh)

# Create directory for temporary files if it doesn't exist
if [[ ! -d "$TMPDIR" ]]; then
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

# Download and install zinit
# https://github.com/zdharma-continuum/zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  log "Downloading zinit to $ZINIT_HOME":w
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Create local completions directory if it doesn't exist
if [[ ! -d "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions" ]]; then
  mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions"
fi
