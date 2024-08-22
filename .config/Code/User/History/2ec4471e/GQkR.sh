#!/usr/bin/env bash


dir="$HOME/.config/rofi/theme.rasi"
# theme='style-3-batt'


message="
   Low battery 
plug in the charger"
# ok =' OK'

show_message() {
    rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 300px; height: 100px;}' \
        -theme-str 'mainbox {children: ["textbox"];}' \
        -theme-str 'textbox {horizontal-align: 0.5; vertical-align: 0.5; text-color: #E06C75FF;}' \
        -e "$message" \
        -theme ${dir}
}

check_battery() {
    while true; do
        battery_level=$(upower -i $(upower -e | grep battery) | grep -E "percentage" | awk '{print $2}' | sed 's/%//')
        charging_status=$(upower -i $(upower -e | grep battery) | grep -E "state" | awk '{print $2}')

        if [ "$battery_level" -le 20 ] && [ "$charging_status" != "charging" ]; then
            show_message
            sleep 30
        else
            sleep 30
        fi
    done
}

check_battery

