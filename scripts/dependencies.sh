#!/bin/bash

# If redhat/fedora, else if ubuntu
if [ -f /etc/redhat-release ]; then
  log "Installing dependencies for RedHat systems"
  # development tools
  sudo dnf groupinstall "Development Tools" "Development Libraries" -y

  # docker
  # https://docs.docker.com/engine/install/fedora/
  sudo dnf config-manager --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

  # additional sources
  sudo dnf copr enable atim/lazygit -y

  # install packages
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ -f /etc/lsb-release ]; then
  log "Installing dependencies for Ubuntu systems"
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
