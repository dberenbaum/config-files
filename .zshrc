# Set PATH
typeset -U path
export PATH=$HOME/bin:/usr/local/bin:/opt/miniconda3/bin:$PATH

# Set function path
fpath=( "$HOME/.zfunctions" $fpath )

# Enable autocompletion
autoload -U compinit
compinit

# Arrow-style autocompletion
zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Shift-Tab
zmodload zsh/complist
bindkey -M menuselect "^[[Z" reverse-menu-complete

# Ignore duplicates in history
setopt HIST_IGNORE_DUPS

# Autoload prompt
#fpath+=$HOME/.zsh/pure
autoload -U promptinit
promptinit
#prompt pure
prompt fade

# Auto rehash to find new executables
setopt nohashdirs
setopt nohashcmds

# Make cd command optional
setopt AUTO_CD

# Share history among sessions
setopt append_history share_history

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M vicmd ',h' beginning-of-line
bindkey -M vicmd ',l' end-of-line

# set editor to vim
export EDITOR='vim'

# set delay time for mode switch
export KEYTIMEOUT=10

# Set up dirstack options
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=10

# return to home dir
cd ~

# aliases

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'
