#!/usr/bin/bash

get_battery_info() {
    # Read battery percentage
    battery_percentage=$(cat /sys/class/power_supply/BAT1/capacity)

    # Read charger status
    charger_status=$(cat /sys/class/power_supply/ACAD/online)
    
    # Determine the charger icon based on status
    if [ "$charger_status" -eq 1 ]; then
        charger_status_text=""
    else
        charger_status_text=""
    fi
    
    # Combine battery percentage with charger status icon (without % symbol)
    battery_text="${battery_percentage} ${charger_status_text}"
    
    echo "$battery_text"
}