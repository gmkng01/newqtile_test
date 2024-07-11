#!/bin/bash

home=$(eval echo ~${SUDO_USER})

# Path to the JSON file
colors_file="$home/.config/rofi/colors.json"

# Path to the Rofi color theme file
color_theme_file="$home/.config/rofi/color.rasi"

# Read colors from JSON
bk=$(jq -r '.bk' $colors_file)
bk2=$(jq -r '.bk2' $colors_file)
fr=$(jq -r '.fr' $colors_file)
fr2=$(jq -r '.fr2' $colors_file)
gr=$(jq -r '.gr' $colors_file)

# Check if colors are correctly read
# echo "bk: $bk"
# echo "bk2: $bk2"
# echo "fr: $fr"
# echo "fr2: $fr2"
# echo "gr: $gr"

# Ensure we have valid colors
# if [[ -z "$bk" || -z "$bk2" || -z "$fr" || -z "$fr2" || -z "$gr" ]]; then
#     echo "Error: One or more colors are empty."
#     exit 1
# fi



sed -i "/* {bg: /c\* {bg: $bk;bga: $bk2;fr: $fr;fra: $fr2;gr: $gr;}" $color_theme_file

# sed -i "/    bga: /c\    bga: $bk2;" $color_theme_file
# sed -i "/    fr: /c\    fr: $fr;" $color_theme_file
# sed -i "/    fra: /c\    fra: $fr2;" $color_theme_file
# sed -i "/    gr: /c\    gr: $gr;" $color_theme_file

# Confirm changes
# echo "Updated $color_theme_file with new colors."
