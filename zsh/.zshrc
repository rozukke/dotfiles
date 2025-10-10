if command -v zellij > /dev/null 2>&1; then
  # Zellij autostart
  alias zellij="zellij --layout compact"
  eval "$(zellij setup --generate-auto-start zsh)"
fi

# Set path for zinit and plugin store
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"

# Download zinit if not available
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Snippets
zinit snippet OMZL::git.zsh # git functions
zinit snippet OMZP::git # git aliases
zinit snippet OMZP::sudo # sudo aliases
zinit snippet OMZP::command-not-found # sudo aliases

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Bindings
bindkey '^p' history-search-forward
bindkey '^n' history-search-backward

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Variables
BAT_THEME="ansi"
LANG=en_US.UTF-8

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

path+=("$HOME/.local/bin" "$HOME/.cargo/bin")
export PATH

export EDITOR='nvim'

# Integrations
eval "$(zoxide init zsh)"
# eval "$(fzf --zsh)"
eval "$(starship init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias cat="batcat --paging=never"
alias cd="z"
alias cl="clear"
alias ls="ls --color -a"
alias la="ls --color -lah"
alias edit="nvim"
alias fd="fdfind"
alias vim="nvim"

# Variables
export CXX=/usr/bin/clang++
export LDFLAGS="-fuse-ld=mold"
