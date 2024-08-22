#!/usr/bin/env bash 


picom --no-fading-openclose &
nm-applet &
volctl &
nitrogen --restore &
lxsession &

# emacs --daemon &
