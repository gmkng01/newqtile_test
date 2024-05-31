#!/bin/sh


# send_notification() {
# 	volume=$(pamixer --get-volume)
# 	# dunstify -a "changevolume" -u low -r 9993 -h int:value:"$volume" -i "volume" "Volume" "Currently at ${volume}%" -t 2000
# }

# case $1 in
# up)
# 	# Set the volume on (if it was muted)
# 	pamixer --allow-boost
# 	pamixer -u
# 	pamixer -i 5
# 	send_notification "$1"
# 	;;
# down)
# 	pamixer -u
# 	pamixer -d 5
# 	send_notification "$1"
# 	;;
# mute)
# 	pamixer -t
# 	if eval "$(pamixer --get-mute)"; then
# 		# dunstify -a "changevolume" -t 2000 -r 9993 -u low -i "volume-mute" "Volume" "Currently muted"
# 	else
# 		send_notification up
# 	fi
# 	;;
# esac




# send_notification() {
#     volume=$(pamixer --get-volume)
#     # Send the volume percentage to zenity in the background
#     (
#         echo $volume
#         sleep 1
#     ) | zenity --progress --title="Volume" --text="Volume: ${volume}%" --percentage=$volume --auto-close --no-cancel
# }

# case $1 in
# up)
#     # Set the volume on (if it was muted)
#     pamixer --allow-boost
#     pamixer -u
#     pamixer -i 5
#     send_notification "$1"
#     ;;
# down)
#     pamixer -u
#     pamixer -d 5
#     send_notification "$1"
#     ;;
# mute)
#     pamixer -t
#     if eval "$(pamixer --get-mute)"; then
#         zenity --notification --text="Volume: Currently muted"
#     else
#         send_notification up
#     fi
#     ;;
# esac




send_notification() {
    volume=$(pamixer --get-volume)
    # (echo -e "Volume: ${volume}%\nPress any key to close..." | rofi -dmenu -p "Volume Control"; pkill rofi) &
    sleep 0.3
    pkill rofi
}

case $1 in
up)
    pamixer --allow-boost
    pamixer -u
    pamixer -i 2
    send_notification &
    ;;
down)
    pamixer -u
    pamixer -d 2
    send_notification &
    ;;
mute)
    pamixer -t
    if eval "$(pamixer --get-mute)"; then
        # (echo -e "Volume: Currently muted\nPress any key to close..." | rofi -dmenu -p "Volume Control"; pkill rofi) &
        sleep 1
        pkill rofi
    else
        send_notification &
    fi
    ;;
esac