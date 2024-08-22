#!/bin/bash

# Function to check if any window is in full-screen mode
is_fullscreen() {
    # Get the ID of the active window
    active_window_id=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')

    # Check if the active window is full-screen
    xprop -id "$active_window_id" | grep -q "_NET_WM_STATE_FULLSCREEN"
}

# Loop to check full-screen status periodically
while true; do
    if is_fullscreen; then
        # Hide Lemonbar by killing the process (assumes Lemonbar is the only bar running)
        pkill lemonbar
    else
        # Relaunch Lemonbar if it's not running
        pgrep lemonbar > /dev/null || ./lemonbar.sh &
    fi
    sleep 1  # Check every second
done