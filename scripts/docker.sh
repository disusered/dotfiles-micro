#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Enable Docker and start
  # https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot
  log "Enable docker and containerd services"
  sudo systemctl enable docker.service --now
  sudo systemctl enable containerd.service --now

  # Allow using Docker without sudo
  # https://docs.docker.com/engine/install/linux-postinstall/

  # Create docker group if it doesn't exist
  if ! getent group docker >/dev/null; then
    sudo groupadd docker
  fi

  # Add user to docker group if they aren't already
  if ! groups $USER | grep -q docker; then
    sudo usermod -aG docker $USER
  fi
#elif [[ "$OSTYPE" == "darwin"* ]]; then
#  log "Installing Docker"
fi

# Download Docker completions to local completions directory
if [[ ! -f ${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions/_docker ]]; then
  log "Downloading Docker completions to local completions directory"
  curl \
    -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
    -o "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions/_docker"
fi

# Download Docker Compose completions to local completions directory
if [[ ! -f ${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions/_docker-compose ]]; then
  log "Downloading Docker Compose completions to local completions directory"
  curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose \
    -o "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions/_docker-compose"
fi
