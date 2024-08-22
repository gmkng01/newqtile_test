#!/bin/bash

# ./lemonbar.sh &

# # Function to check if any window is in full-screen mode
# is_fullscreen() {
#     # Get the ID of the active window
#     active_window_id=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')

#     # Check if the active window is full-screen
#     xprop -id "$active_window_id" | grep -q "_NET_WM_STATE_FULLSCREEN"
# }

# # Function to launch Lemonbar
# launch_lemonbar() {
#     # Replace this with the command you use to start Lemonbar
#     ./lemonbar.sh &
# }

# # Variable to track if Lemonbar is currently hidden
# lemonbar_hidden=false

# # Loop to check full-screen status periodically
# while true; do
#     if is_fullscreen; then
#         if ! $lemonbar_hidden; then
#             # Hide Lemonbar by killing the process (assumes Lemonbar is the only bar running)
#             pkill lemonbar
#             lemonbar_hidden=true
#         fi
#     else
#         if $lemonbar_hidden; then
#             # Relaunch Lemonbar if it's hidden
#             launch_lemonbar
#             lemonbar_hidden=false
#         fi
#     fi
#     sleep 1  # Check every second
# done




# Function to check if any window is in full-screen mode
is_fullscreen() {
    # Get the ID of the active window
    active_window_id=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5)
    # Check if the active window is full-screen
    xprop -id "$active_window_id" | grep -q "_NET_WM_STATE_FULLSCREEN"
    return $?
}

# Function to launch Lemonbar with custom configs
launch_lemonbar() {
    # echo "Launching lemonbar..."
    ./lemonbar.sh &
    # echo "Lemonbar launched"
}

# Function to kill Lemonbar
kill_lemonbar() {
    # echo "Killing lemonbar..."
    killall lemonbar
    # echo "Lemonbar killed"
}

# Initial launch of Lemonbar
launch_lemonbar

# Variable to track if Lemonbar is currently hidden
lemonbar_hidden=false

# Loop to check full-screen status periodically
while true; do
    if is_fullscreen; then
        echo "Fullscreen window detected"
        if ! $lemonbar_hidden; then
            # echo "Hiding lemonbar"
            kill_lemonbar
            lemonbar_hidden=true
        fi
    else
        echo "No fullscreen window detected"
        if $lemonbar_hidden; then
            # echo "Relaunching lemonbar"
            launch_lemonbar
            lemonbar_hidden=false
        fi
    fi
    sleep 0.5 # Check every second
done