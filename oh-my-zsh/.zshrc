# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="intheloop"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf zsh-autosuggestions z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
# export EDITOR='vim'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
bindkey -M viins 'jj' vi-cmd-mode

mktouch() { mkdir -p $(dirname $1) && touch $1; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias tmux="TERM=xterm-256color tmux" # So this environment variable change is required to make tmux having true color support

alias i3conf="vim ~/.config/i3/config"
alias alconf="vim ~/.config/alacritty/alacritty.yml"
alias piconf="vim ~/.config/compton/compton.conf"

alias diff="colordiff"

alias mv="mv -i"
alias rm="rm -i"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias cp="cp -iv"
#alias emacs="GTK_IM_MODULE=fcitx GTK_IM_MODULE=fcitx XMODIFIERS=@im=fcitx LC_CTYPE=zh_CN.UTF-8 emacs"

alias machd="./mach run --debugger=rr"
alias machde="./mach run --debugger=rr --disable-e10s"

# Taskwarrior related
#alias in='task add +in'

alias vim='nvim'
alias vimdiff="nvim -d"
alias vi="vifm"
alias t="task"

# alias cat='bat'
alias opsignin='eval $(op signin sefeng)'

#Taskoo
alias in='tt add'
alias tm='tt modify'
alias tr='tt remove'
alias td='tt delete'
alias tl='tt list'
alias ts='tt start'
alias ti='tt info'

alias gtd='tt list c:Gtd'
alias inbox='tt list c:Inbox'
alias tick='tt list c:tick'
alias smd='tt list c:smd'
alias today='tt agenda today'
alias week='tt view all 1weeks'
alias anno='tt annotate'
alias review='tt review'
alias lg='lazygit'

# Git
alias gca='git commit -a'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status -uno'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Running term in 256 bit mode
# export TERM=xterm-256color
#
readwiki() { mdless "$(ls -d -1 ~/.local/Dropbox/wiki/*.* |fzf)" }

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.mozbuild/clang/bin:$PATH"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Wireguard
alias wgu='sudo wg-quick up'
alias wgd='sudo wg-quick down'
alias wgs='sudo wg show'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


export JAVA_HOME="/home/sefeng/.mozbuild/jdk/jd-17.0.11+9"
export ANDROID_HOME="/home/sefeng/.mozbuild/android-sdk-linux"

