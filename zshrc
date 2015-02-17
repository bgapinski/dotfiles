# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

autoload -U colors && colors

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-theme"

fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        fg
        zle redisplay
    else
        zle push-input
        zle clear-screen
    fi
}

zle -N fancy-ctrl-z

bindkey '^Z' fancy-ctrl-z
bindkey -v

fignore=(.o .hi .aux .pyc .class)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pacman="sudo powerpill"
alias tmux="tmux -2"
alias python="python3"
alias pip="pip3"
alias vim="nvim"
alias vmi="nvim"
alias hibernate="systemctl hibernate"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

NORMAL_INDICATOR="%{$fg_bold[red]%}[% N]% %{$reset_color%}"
INSERT_INDICATOR="%{$fg_bold[blue]%}[% I]% %{$reset_color%}"
OPP_INDICATOR="%{$fg_bold[yellow]%}[% O]% %{$reset_color%}"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast colored-man vi-mode-custom opp opp-surround)

source $ZSH/oh-my-zsh.sh
export EDITOR=vim

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/brian/.cabal/bin:/home/brian/.scripts:$PATH

export WECHALLUSER="xechas"
export WECHALLTOKEN="D5B30-17222-EDA30-4E1C4-BFF39-587BC"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
