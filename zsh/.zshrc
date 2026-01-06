# Set path for zinit and plugin store
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"

# Download zinit if not available
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Snippets
zinit snippet OMZL::git.zsh # git functions
zinit snippet OMZP::git # git aliases
zinit snippet OMZP::sudo # sudo aliases
zinit snippet OMZP::command-not-found # sudo aliases

# Load completions
autoload -U compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

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
LANG=en_US.UTF-8

path+=("$HOME/.local/bin" "$HOME/.cargo/bin")
export PATH

export EDITOR='nvim'

# Integrations
if command -v "zoxide" > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi
if command -v "fzf" > /dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi
if command -v "starship" > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
if command -v "batcat" > /dev/null 2>&1; then
  BAT_THEME="ansi"
  alias cat="batcat --paging=never"
fi
if command -v "nvim" > /dev/null 2>&1; then
  alias vim="nvim"
fi
if command -v "fdfind" > /dev/null 2>&1; then
  alias fd="fdfind"
fi


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd" || return
	rm -f -- "$tmp"
}

alias cl="clear"
alias ls="ls --color -a"
alias la="ls --color -lah"
alias ..="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias b="cd -"

# Variables
#
if command -v "clang++" > /dev/null 2>&1; then
    export CXX=/usr/bin/clang++
fi
if command -v "mold" > /dev/null 2>&1; then
    export LDFLAGS="-fuse-ld=mold"
fi

# Zellij autostart
if command -v "zellij" > /dev/null 2>&1; then
    eval "$(zellij setup --generate-auto-start zsh)"
fi

