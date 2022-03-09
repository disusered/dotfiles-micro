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
case $(uname) in
  'Darwin')
    # TODO
    ;;
  'Linux')
    sudo pip3 install --upgrade setuptools pip virtualenv
    pip install --user --upgrade pipx pynvim
    ;;
esac


# Neovim dependencies
pipx install pipenv
pipx install neovim-remote
pipx install virtualenv
pipx install virtualenvwrapper
pipx install hererocks
volta install neovim tree-sitter prettier prettier-eslint eslint eslintd
cargo install tree-sitter-cli
