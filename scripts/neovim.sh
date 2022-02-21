#!/bin/bash

# if packer.nvim hasn't been cloned, clone it otherwise update
if [ ! -d ~/.config/nvim/pack/plugins/start/packer.nvim ]; then
  log "Cloning packer.nvim"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
else
  log "Updating packer.nvim"
  cd ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull
fi
