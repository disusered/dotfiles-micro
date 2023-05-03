#!/bin/bash

# Install Volta if not already installed
if [ ! -f ~/.volta/bin/volta ] || [ ! -f /usr/local/bin/volta ]; then
  log "Installing Volta for Node"
  curl https://get.volta.sh | bash -s -- --skip-setup
fi

# Install Node if not already installed
if [ ! -f ~/.volta/bin/node ]; then
  log "Installing latest Node"
  VOLTA_HOME="$HOME/.volta"
  $VOLTA_HOME/bin/volta install node
fi

# Install NPM if not already installed
if [ ! -f ~/.volta/bin/npm ]; then
  log "Installing latest NPM"
  VOLTA_HOME="$HOME/.volta"
  $VOLTA_HOME/bin/volta install npm
fi

# Install Yarn if not already installed
if [ ! -f ~/.volta/bin/yarn ]; then
  log "Installing latest Yarn"
  VOLTA_HOME="$HOME/.volta"
  $VOLTA_HOME/bin/volta install yarn
fi
