#!/bin/bash

# File paths
colors_json="/home/abhi/.config/rofi/colors.json"
color_rasi="/home/abhi/.config/rofi/color.rasi"

update_colors() {
    # Read JSON values
    bk=$(jq -r '.bk' $colors_json)
    bk2=$(jq -r '.bk2' $colors_json)
    fr=$(jq -r '.fr' $colors_json)
    fr2=$(jq -r '.fr2' $colors_json)
    gr=$(jq -r '.gr' $colors_json)
    
    new_content="* {bg:${bk};bga:${bk2};fr:${fr};fra:${fr2};gr:${gr};}"

    echo "$new_content" > $color_rasi
}

inotifywait -m -e close_write $colors_json | while read -r filename event; do
    update_colors
done
