#!/bin/bash

# File paths
colors_json="$HOME/.config/rofi/colors.json"
color_rasi="$HOME/.config/rofi/color.rasi"

# Function to update color.rasi based on colors.json
update_colors() {
    # Read JSON values
    bk=$(jq -r '.bk' $colors_json)
    bk2=$(jq -r '.bk2' $colors_json)
    fr=$(jq -r '.fr' $colors_json)
    fr2=$(jq -r '.fr2' $colors_json)
    gr=$(jq -r '.gr' $colors_json)
    
    # Create new content for color.rasi
    new_content="* {bg:${bk};bga:${bk2};fr:${fr};fra:${fr2};gr:${gr};}"

    # Write new content to color.rasi
    echo "$new_content" > $color_rasi
}

# Monitor changes in colors.json and update color.rasi accordingly
inotifywait -m -e close_write $colors_json | while read -r filename event; do
    update_colors
done
