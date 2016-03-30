#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux at shell login
[[ -z "$TMUX" ]] && exec tmux -2

# Less strict filename matching
shopt -s cdspell nocaseglob

# Ignore duplicate entries
export HISTCONTROL=ignoredups

# Prompt style
PS1='\e[0;34m\e[47m\u@\h \w]\e[0m\n\$ '

alias ls='ls --color=auto'
