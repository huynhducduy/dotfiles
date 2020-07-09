# Path to your oh-my-zsh installation.
export ZSH="/Users/huynhducduy/.oh-my-zsh"

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
export UPDATE_ZSH_DAYS=30

# If you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom time format using the strftime function format specifications,
# HIST_STAMPS="mm/dd/yyyy"

# Use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  osx
  autojump
  zsh-autosuggestions
  zsh-completions
  history-substring-search
  last-working-dir
  extract
  autoupdate
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
autoload -U compinit && compinit

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Update macos software & brew
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask upgrade; npm install npm -g; npm update -g;'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}
