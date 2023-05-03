#!/bin/bash

# Root directory for bootstrap scripts
ROOT="${HOME}/.dotfiles/scripts"

# Create pretty logging function
log() {
  echo -e "\033[1;32m[+]\033[0m $1"
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Install Linux dependencies
  source $ROOT/dependencies.sh

  # Install manual dependencies
  source $ROOT/fonts.sh
  source $ROOT/rust.sh
  source $ROOT/node.sh
  source $ROOT/keybase.sh
  source $ROOT/greenclip.sh
  source $ROOT/shell.sh
  source $ROOT/tmux.sh
  source $ROOT/ssh.sh
  source $ROOT/docker.sh
  source $ROOT/fzf.sh
  source $ROOT/neovim.sh

  # Symlink configs with stow
  source $ROOT/symlinks.sh

elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Install Homebrew if brew doesn't exist
  if ! command -v brew &> /dev/null; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install Homebrew bundle
  log "Installing Homebrew bundle"
  cd $HOME/.dotfiles/packages
  brew bundle

  # Install dependencies
  source $ROOT/rust.sh
  source $ROOT/node.sh
  source $ROOT/shell.sh
  source $ROOT/tmux.sh
  source $ROOT/ssh.sh
  source $ROOT/fzf.sh
  source $ROOT/docker.sh
  source $ROOT/neovim.sh

  # Configure symlinks to configs
  STOW_DIR="~/.dotfiles/configs"
  log "Installing dotfiles"
  stow -d ~/.dotfiles/ -R git zsh tmux neovim ag rg psql gpg
fi
