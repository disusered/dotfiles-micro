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
