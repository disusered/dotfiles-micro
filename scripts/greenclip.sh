#!/bin/bash

VERSION="v4.2"
GREENCLIP_BIN="~/.dotfiles/.local/bin/greenclip"

# If greenclip file doesn't exist, download it
if [ ! -f $GREENCLIP_SYMLINK ]; then
  echo "Installing Greenclip for Rofi"
  wget https://github.com/erebe/greenclip/releases/download/${VERSION}/greenclip $GREENCLIP_BIN
end
