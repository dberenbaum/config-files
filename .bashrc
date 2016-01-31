#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux at shell login
[[ -z "$TMUX" ]] && exec tmux -2

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
