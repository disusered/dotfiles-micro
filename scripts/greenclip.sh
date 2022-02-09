#!/bin/bash

VERSION="v4.2"
GREENCLIP_BIN="~/.dotfiles/bin/greenclip"
GREENCLIP_SYMLINK="~/.local/bin/greenclip"

# If greenclip file doesn't exist, download it
if [ ! -f $GREENCLIP_SYMLINK ]; then
  echo "Installing Greenclip for Rofi"
  wget https://github.com/erebe/greenclip/releases/download/${VERSION}/greenclip $GREENCLIP_BIN
  ln -s $GREENCLIP_BIN $GREENCLIP_SYMLINK
end
