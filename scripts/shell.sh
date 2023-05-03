#!/bin/sh

# Set default shell for user to zsh
# TODO: Fix for Linux
DEFAULT_SHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')

if [[ $DEFAULT_SHELL != "/usr/local/bin/zsh" ]]; then
  if [[ $(command -v zsh) ]]; then
    sudo chpass -s /usr/local/bin/zsh $USER
    log "ZSH set as default shell for $USER"
  else
    log "ZSH is not installed. Please install ZSH and try again."
    exit 1
  fi
else
  log "ZSH is already the default shell for $USER"
fi

# Create directory for temporary files if it doesn't exist
if [[ ! -d "$TMPDIR" ]]; then
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

# Create local completions directory if it doesn't exist
if [[ ! -d "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions" ]]; then
  mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions"
fi
