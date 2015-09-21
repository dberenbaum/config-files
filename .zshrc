# Set PATH
typeset -U path
path=(~/bin /other/things/in/path $path)

# Set function path
fpath=( "$HOME/.zfunctions" $fpath )

# Enable autocompletion
autoload -U compinit
compinit

# Arrow-style autocompletion
zstyle ':completion:*' menu select

# Complete command line switches for aliases
setopt completealiases

# Ignore duplicates in history
setopt HIST_IGNORE_DUPS

# History search
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

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
# export MANPATH="/usr/local/man:$MANPATH"

# vi mode
bindkey -v

# set editor to vim
export EDITOR='vim'

# set delay time for mode switch
export KEYTIMEOUT=1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# shortcut to insert sudo before command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M vicmd 's' sudo-command-line

# History search key bindings

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

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
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/dirhistory
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
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

DIRSTACKSIZE=20

# return to home dir
cd /home/dave

# Aliases
alias zshrc=". ~/.zshrc"
alias tmuxconf="tmux source-file ~/.tmux.conf"
alias rpi="ssh root@192.168.8.104 -t -- /bin/sh -c 'tmux has-session && exec tmux attach || exec tmux'"
alias music="ncmpcpp"
