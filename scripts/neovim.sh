#!/bin/bash

# If packer.nvim hasn't been cloned, clone it otherwise update
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  log "Cloning packer.nvim"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
else
  log "Updating packer.nvim"
  cd ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull
fi

# Install Python dependencies for Neovim
log "Updating Python dependencies"
case $(uname) in
  'Darwin')
    python3 -m pip install --upgrade setuptools pip virtualenv
    python3 -m pip install --user --upgrade pynvim pipx
    ;;
  'Linux')
    sudo pip3 install --upgrade setuptools pip virtualenv
    pip install --user --upgrade pipx pynvim
    ;;
esac


# Neovim dependencies
PYTHON_BIN=$(python3 -c 'import site; print(site.USER_BASE)')/bin
$PYTHON_BIN/pipx install pipenv
$PYTHON_BIN/pipx install neovim-remote
$PYTHON_BIN/pipx install virtualenv
$PYTHON_BIN/pipx install virtualenvwrapper
$PYTHON_BIN/pipx install hererocks

# TODO: Fix on Linux
log "Updating Node dependencies"
LOCAL_NPM=/usr/local/bin/npm
$LOCAL_NPM install -g neovim tree-sitter prettier prettier-eslint eslint

log "Updating Rust dependencies"
cargo install tree-sitter-cli
