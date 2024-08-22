#!/usr/bin/env bash 


picom --no-fading-openclose &
nm-applet &
volctl &
nitrogen --restore &
lxsession &
~/.config/scripts/battery_low.sh &
~/.config/polybar/launch.sh &
# killall trayer &
trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x2C3333 --margin 27 --distance 0 --distancefrom top &


# emacs --daemon &
