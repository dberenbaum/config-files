#!/bin/bash

# Load Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disable touchpad while typing
syndaemon -d -k -t -i 1 &

# enable xscreensaver
exec /usr/bin/xscreensaver -no-splash &

# auto lock screen
exec xss-lock -- xscreeensaver-command -lock &

# key mappings
xmodmap ~/.xmodmap

# Start i3 window manager
exec i3

