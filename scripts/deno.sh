# Download Deno completions to local completions directory
if [[ ! -f ${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions/_deno ]]; then
  # log "Downloading Deno completions to local completions directory"
  deno completions zsh > "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/completions/_deno"
fi
