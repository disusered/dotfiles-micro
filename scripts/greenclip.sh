#!/bin/bash

VERSION="v4.2"
BIN_PATH="~/.dotfiles/bins/bin/"
GREENCLIP_BIN="${BIN_PATH}/greenclip"

# If greenclip file doesn't exist, download it
if [ ! -f $GREENCLIP_BIN ]; then
  echo "Installing Greenclip for Rofi"
  wget https://github.com/erebe/greenclip/releases/download/${VERSION}/greenclip -P $BIN_PATH
  chmod +x $GREENCLIP_BIN
fi
