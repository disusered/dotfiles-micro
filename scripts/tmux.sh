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
tic /tmp/xterm.terminfo

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # reset nvim shada viminfo if the directory exists
  SHADA_DIR="$XDG_DATA_HOME/nvim/shada"
  if [ -d "$SHADA_DIR" ]; then
    rm -rf $SHADA_DIR
  fi
fi
