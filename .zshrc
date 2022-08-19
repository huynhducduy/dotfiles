export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE="false"

# CASE_SENSITIVE="true"
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

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
autoload -U compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  autoupdate
  git
  macos
  last-working-dir
  extract
  autojump
  fzf-tab
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  history-substring-search
  tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$JAVA_HOME/bin:$PATH
# export ANDROID_HOME="~/Library/Android/sdk"
# export PATH=$ANDROID_HOME/platform-tools:$PATH
# export PATH=$ANDROID_HOME/tools:$PATH
# export PATH=$ANDROID_HOME/tools/bin:$PATH
# export PATH="/usr/local/opt/openjdk/bin:$PATH"

export GOPATH=$HOME/.go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GOTOOLDIR="${GOROOT}/pkg/tool/darwin_amd64"
export GOARCH="amd64"
export GOBIN=""
export GOEXE=""
export GOHOSTARCH="amd64"
export GOHOSTOS="darwin"
export GOOS="darwin"
export GORACE=""
export CC="clang"
export GOGCCFLAGS="-fPIC -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/g8/551vgzq10c7bdq3k7zby5_gw0000gn/T/go-build818624631=/tmp/go-build -gno-record-gcc-switches -fno-common"
export CXX="clang++"
export CGO_ENABLED="1"

# Update macos software & brew & nodejs packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew upgrade --cask; brew cleanup; npm install npm -g; npm update -g;'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Start an HTTP server from a directory, optionally specifying the port, require python3
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	python -m http.server ${port}
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

source "$HOME/.config/broot/launcher/bash/br"

export NPM_TOKEN="xxx"

eval "$(fnm env --use-on-cd)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
