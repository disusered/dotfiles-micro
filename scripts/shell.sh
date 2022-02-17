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
