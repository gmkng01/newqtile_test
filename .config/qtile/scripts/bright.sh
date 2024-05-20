#!/bin/sh

send_notification() {
	brightness=$(brightnessctl get)
    max_brightness=$(brightnessctl max)

    # Calculate brightness percentage
    percentage=$((brightness * 100 / max_brightness))

	dunstify -u low -r 9994 -h int:value:"$percentage" -i "brightness" "brightness" "Currently at ${percentage}%"
}

case $1 in
up)
	# Set the brightness on (if it was muted)	
	brightnessctl set +5%
	send_notification "$1"
	;;
down)
	brightnessctl set 5%-
	send_notification "$1"
	;;
esac