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

  # github cli
  # https://github.com/cli/cli/blob/trunk/docs/install_linux.md
  sudo dnf config-manager --add-repo \
    https://cli.github.com/packages/rpm/gh-cli.repo

  sudo dnf config-manager --add-repo \
    https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

  # gcloud
  # https://cloud.google.com/sdk/docs/install
  sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

  # additional sources
  sudo dnf copr enable atim/lazygit -y

  # install packages
  sudo dnf install -y $(cat $HOME/.dotfiles/packages/dnf)
elif [ -f /etc/lsb-release ]; then
  log "Installing dependencies for Ubuntu systems"
  sudo apt-get install -y $(cat $HOME/.dotfiles/packages/apt)
fi
