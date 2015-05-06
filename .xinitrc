#!/bin/bash

# Load Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Activate screen locker
xss-lock -- i3lock &
xautolock -time 10 -locker "i3lock" &

# Activate numlock
numlockx &

# Start urxvt daemon 
urxvtd -q -f -o

# Start i3 window manager
exec i3

# Hide mouse cursor when not used
unclutter &
