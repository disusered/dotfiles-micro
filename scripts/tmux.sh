# !/bin/bash


# One-time setup for italic support (instead of reverse).
# http://www.micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html
infocmp xterm-256color |
sed -e 's/^screen[^|]*|[^,]*,/screen-it|screen with italics support,/' \
  -e 's/%?%p1%t;3%/%?%p1%t;7%/' \
  -e 's/smso=[^,]*,/smso=\\E[7m,/' \
  -e 's/rmso=[^,]*,/rmso=\\E[27m,/' \
  -e '$s/$/ sitm=\\E[3m, ritm=\\E[23m,/' \
  >| /tmp/xterm.terminfo

# Compile and create binary file ~/.terminfo/[number]/xterm-256color
log "Compiling terminfo file"
tic /tmp/xterm.terminfo

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # reset nvim shada viminfo if the directory exists
  SHADA_DIR="$XDG_DATA_HOME/nvim/shada"
  if [ -d "$SHADA_DIR" ]; then
    rm -rf $SHADA_DIR
  fi
fi

# if tpm is not installed, install it
TMUX_DIR="$HOME/.tmux"
if ! [ -x "$(command -v tpm)" ]; then
  echo "Installing tpm for tmux"
  git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
fi
