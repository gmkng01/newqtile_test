#!/usr/bin/env bash 


picom --no-fading-openclose &
nm-applet &
volctl &
nitrogen --restore &
lxsession &

# Trayer 
if pgrep -x "trayer" > /dev/null; then
    # If running, kill trayer
    killall trayer
fi
trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x2C3333 --margin 27 --distance 0 --distancefrom top &

# For notification popup when Battery is bellow or equal 20%
~/.config/scripts/battery_low.sh &

# Power Managment
xfce4-power-manager &

# emacs --daemon &
