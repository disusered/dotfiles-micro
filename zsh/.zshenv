# ZSH environment variable for temporary files
export TMPDIR="/tmp/$USER"

# Locale settings
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_NUMERIC='en_US.UTF-8'
export LC_TIME='en_US.UTF-8'
export LC_COLLATE='en_US.UTF-8'
export LC_MONETARY='en_US.UTF-8'
export LC_MESSAGES='en_US.UTF-8'

# Set the default editor
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Configure options for less
export LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-X -F -g -i -M -R -S -w -z-4'

# Set Git options
export GIT_LOG_STYLE_BASIC="%C(magenta bold)%h%C(reset) %C(auto)%d%C(reset) %s"
export GIT_LOG_STYLE_COMPLEX="%C(magenta bold)%h%C(reset) %C(blue bold)%aN%C(reset) %C(auto)%d%C(reset) %s %C(8)(%cr)%C(reset)"
export GIT_LOG_STYLE=$GIT_LOG_STYLE_COMPLEX
