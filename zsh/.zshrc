# Initialize zinit/zplugin
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zplugin light zsh-users/zsh-history-substring-search
zplugin light zdharma/fast-syntax-highlighting

# theme
# https://github.com/sindresorhus/pure
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

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
case $(uname) in
  'Linux')
    vi-append-x-selection () { RBUFFER=$(xsel -o --clipboard </dev/null)$RBUFFER; }
    zle -N vi-append-x-selection
    bindkey -a 'p' vi-append-x-selection
  ;;
esac

# Load FZF plugin for zsh, if available on XDG else use $HOME
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autoload module completion
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
autoload -U +X bashcompinit && bashcompinit

# Enable profiling
# zprof
