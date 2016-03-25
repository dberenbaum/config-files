# Set PATH
typeset -U path
path=(~/bin $path)

# Set function path
fpath=( "$HOME/.zfunctions" $fpath )

# Enable autocompletion
autoload -U compinit
compinit

# Arrow-style autocompletion
zstyle ':completion:*' menu select

# Shift-Tab
zmodload zsh/complist
bindkey -M menuselect "^[[Z" reverse-menu-complete

# Complete command line switches for aliases
setopt completealiases

# Ignore duplicates in history
setopt HIST_IGNORE_DUPS

# Autoload prompt
autoload -U promptinit
promptinit

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

# Set path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M vicmd ',h' beginning-of-line
bindkey -M vicmd ',l' end-of-line

# set editor to vim
export EDITOR='vim'

# set delay time for mode switch
export KEYTIMEOUT=10

# shortcut to insert sudo before command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
bindkey -M vicmd 's' sudo-command-line

# History search key bindings

# bind UP and DOWN arrow keys
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# load zgen
source "${HOME}/Code/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # zgen oh-my-zsh

    # plugins
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions

    # completions
    zgen load zsh-users/zsh-completions src

    # save all to init script
    zgen save

    echo "Created zgen save"
fi

# Set pure prompt
prompt pure

# Leave the following at end of file so it doesn't record
# dir movement while executing .zshrc

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
