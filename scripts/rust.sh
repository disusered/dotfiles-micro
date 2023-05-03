#!/bin/bash

# install rust if not installed
if ! [ -x "$(command -v rustc)" ]; then
  log "Installing Rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
