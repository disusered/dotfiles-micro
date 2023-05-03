# Initialize zinit/zplugin
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load custom functions
source $HOME/.config/zsh/zshfuns

# theme
# https://github.com/sindresorhus/pure
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# plugins
zplugin light zsh-users/zsh-history-substring-search
zplugin light zdharma/fast-syntax-highlighting

# History options
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=$HOME/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP

# Load custom alias
source $HOME/.config/zsh/zshalias

# Enable vim mode
bindkey -v

# History substring search with Ctrl-R
bindkey '^R' history-incremental-search-backward

# History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Delete key
bindkey '^[[3~' delete-char
bindkey -M vicmd '^[[3~' delete-char

# Undo/Redo
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo

# Paste in vim mode with p
    vi-append-x-selection () { RBUFFER=$(clippaste </dev/null)$RBUFFER; }
    zle -N vi-append-x-selection
    bindkey -a 'p' vi-append-x-selection

# Load FZF plugin for zsh, if available on XDG else use $HOME
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# completions
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
  zsh-users/zsh-completions

# Autoload module completion
autoload -Uz compinit
compinit

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -U +X bashcompinit
bashcompinit

# Enable profiling
# zprof

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
