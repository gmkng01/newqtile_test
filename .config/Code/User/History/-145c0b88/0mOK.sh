#!/bin/sh

desktops=$(bspc query -D --names)
focused=$(bspc query -D --names -d focused)
nodes=$(bspc query -N -d $desktop)
echo $nodes