#!/usr/bin/env bash 

picom --no-fading-openclose &
nm-applet &
volctl &
nitrogen --restore &
lxsession &
sxhkd &

# For notification popup when Battery is bellow or equal 20%
~/.config/scripts/battery_low.sh &

# Power Managment
xfce4-power-manager &

# Polybar
~/.config/polybar/launch.sh &

# emacs --daemon &
