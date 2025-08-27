export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
export UPDATE_ZSH_DAYS=30
# ZSH_TMUX_AUTOSTART="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  autoupdate
  # git
  macos
  last-working-dir
  extract
  fzf
  fzf-tab
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  # fast-syntax-highlighting
  zsh-history-substring-search
  evalcache
  bgnotify
  you-should-use
  mise
  # tmux
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Prefer US English and use UTF-8.
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch arm64"

HOMEBREW_PREFIX="/opt/homebrew"
HOMEBREW_DOWNLOAD_CONCURRENCY=auto

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-getopt/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/libpq/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/icu4c@77/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/icu4c@77/sbin:$PATH"

# export LDFLAGS="-L$HOMEBREW_PREFIX/opt/libpq/lib"
# export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/libpq/include"
# export LDFLAGS="-L$HOMEBREW_PREFIX/opt/curl/lib"
# export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/curl/include"
# export LDFLAGS="-L$HOMEBREW_PREFIX/opt/icu4c@77/lib"
# export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/icu4c@77/include"

# ANDROID environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/

# GOLANG environment variables: `go help environment`, https://pkg.go.dev/go/build, https://pkg.go.dev/cmd/cgo
# export CC="clang"
# export CXX="clang++"
# export CGO_ENABLED="1"

# DOCKER environment variables
export DOCKER_BUILDKIT=1

# PYTHON alias
alias python=python3
alias pip=pip3

# CARGO
CARGO_UNSTABLE_GC=true

# Update macos software & brew & nodejs packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew upgrade --cask; brew cleanup -s; brew autoremove; "$ZSH/tools/upgrade.sh"; mise upgrade; mise prune; mise cache clean; npm install npm -g; npm update -g; pip install --upgrade pip;'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Start an HTTP server from a directory, optionally specifying the port, require python3
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	python3 -m http.server ${port}
}

# Generate a random string (using as secret) with given bytes
function secret() {
	local bytes="${1:-16}"
	head -c $bytes </dev/urandom|xxd -p -u
}

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

# History configuration
setopt HIST_REDUCE_BLANKS        # remove superfluous blanks before recording entry.
setopt SHARE_HISTORY             # share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS      # delete old recorded entry if new entry is a duplicate.

source "$HOME/.config/broot/launcher/bash/br"

# Terminal command navigation
bindkey "^[[1;5C" forward-word                      # [Ctrl-right] - forward one word
bindkey "^[[1;5D" backward-word                     # [Ctrl-left] - backward one word
bindkey '^[^[[C' forward-word                       # [Ctrl-right] - forward one word
bindkey '^[^[[D' backward-word                      # [Ctrl-left] - backward one word
bindkey '^[[1;3D' beginning-of-line                 # [Alt-left] - beginning of line
bindkey '^[[1;3C' end-of-line                       # [Alt-right] - end of line
bindkey '^[[5D' beginning-of-line                   # [Alt-left] - beginning of line
bindkey '^[[5C' end-of-line                         # [Alt-right] - end of line
bindkey '^?' backward-delete-char                   # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
    bindkey "${terminfo[kdch1]}" delete-char        # [Delete] - delete forward
else
    bindkey "^[[3~" delete-char                     # [Delete] - delete forward
    bindkey "^[3;5~" delete-char
    bindkey "\e[3~" delete-char
fi
bindkey "^A" vi-beginning-of-line
bindkey -M viins "^F" vi-forward-word               # [Ctrl-f] - move to next word
bindkey -M viins "^E" vi-add-eol                    # [Ctrl-e] - move to end of line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# eliminates duplicates in *paths
typeset -gU cdpath fpath path

# eas autocomplete setup
EAS_AC_ZSH_SETUP_PATH=$HOME/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH;

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Enable brew completions in zsh, this must come before compinit
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# This will call compinit
source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

_evalcache $HOMEBREW_PREFIX/bin/brew shellenv

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

eval "$($HOMEBREW_PREFIX/bin/mise activate zsh)"

# export PATH="$HOME/.cargo/bin:$PATH"

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(starship init zsh)"

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# NodeJS code-caching
export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache

alias graphite="$HOMEBREW_PREFIX/bin/gt"

eval "$(zoxide init zsh)"

alias npm='npq-hero'
alias yarn="NPQ_PKG_MGR=yarn npq-hero"
alias pnpm="NPQ_PKG_MGR=pnpm npq-hero"

source <(COMPLETE=zsh jj)
