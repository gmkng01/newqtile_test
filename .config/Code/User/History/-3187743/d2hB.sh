#!/bin/sh

send_notification() {
    volume=$(pamixer --get-volume)
    # (echo -e "Volume: ${volume}%\nPress any key to close..." | rofi -dmenu -p "Volume Control"; pkill rofi) &
    sleep 0.3
    # pkill rofi
}

case $1 in
up)
    pamixer --allow-boost
    pamixer -u
    pamixer -i 1
    send_notification &
    ;;
down)
    pamixer -u
    pamixer -d 1
    send_notification &
    ;;
mute)
    pamixer -t
    if eval "$(pamixer --get-mute)"; then
        # (echo -e "Volume: Currently muted\nPress any key to close..." | rofi -dmenu -p "Volume Control"; pkill rofi) &
        sleep 1
        # pkill rofi
    else
        send_notification &
    fi
    ;;
esac