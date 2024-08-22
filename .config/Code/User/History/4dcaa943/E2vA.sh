#!/bin/bash

is_fullscreen() {
    active_window_id=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5)
    xprop -id "$active_window_id" | grep -q "_NET_WM_STATE_FULLSCREEN"
    return $?
}

launch_lemonbar() {
    ./lemonbar.sh &
}
kill_lemonbar() {
    killall lemonbar
}
launch_lemonbar

# Variable to track if Lemonbar is currently hidden
lemonbar_hidden=false

while true; do
    if is_fullscreen; then
        if ! $lemonbar_hidden; then
            kill_lemonbar
            lemonbar_hidden=true
        fi
    else
        if $lemonbar_hidden; then
            launch_lemonbar
            lemonbar_hidden=false
        fi
    fi
    sleep 0.5
done