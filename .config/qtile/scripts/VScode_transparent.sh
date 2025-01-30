#!/bin/bash

# Start Visual Studio Code
code &

# Wait for Visual Studio Code to start
sleep 5

# Adjust the opacity of Visual Studio Code windows
for W in $(wmctrl -l | grep "Visual Studio Code" | awk '{print $1}'); do
    xprop -id $W -format _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * 95 / 100)))
done