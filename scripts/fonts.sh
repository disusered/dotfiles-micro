#!/bin/bash

# https://docs.fedoraproject.org/en-US/quick-docs/fonts/

VERSION="v2.1.0"
FONT_DIR="$HOME/.local/share/fonts/saucecode-pro"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/SourceCodePro.zip"

# If on Darwin (Mac OS X), use Homebrew to install font else install manually
case $(uname) in
  'Darwin')
    brew tap homebrew/cask-fonts
    brew install --cask font-sauce-code-pro
    ;;
  'Linux')
    if [ ! -d "$FONT_DIR" ]; then
      wget $FONT_URL -O $TMPDIR/SourceCodePro.zip
      mkdir -p $FONT_DIR
      unzip $TMPDIR/SourceCodePro.zip -d $FONT_DIR
    fi
    ;;
esac

# Install font
sudo fc-cache -v
