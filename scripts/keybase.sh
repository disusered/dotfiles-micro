# https://keybase.io/docs/the_app/install_linux
# https://www.garrickadenbuie.com/blog/signed-verified-git-commits-keybase-rstudio/

log "Install Keybase"
if [ -f /etc/redhat-release ]; then
  if [ $(getconf LONG_BIT) = "64" ]; then
    sudo yum install https://prerelease.keybase.io/keybase_amd64.rpm
  else
    sudo yum install https://prerelease.keybase.io/keybase_i386.rpm
  fi
elif [ -f /etc/lsb-release ]; then
  if [ $(getconf LONG_BIT) = "64" ]; then
    curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb -o /tmp/keybase.deb
  else
    curl --remote-name https://prerelease.keybase.io/keybase_i386.deb -o /tmp/keybase.deb
  fi
  sudo apt install -y /tmp/keybase.deb
fi

