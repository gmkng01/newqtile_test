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

sed -i "/* {bg: /c\* {bg: $bk;bga: $bk2;fr: $fr;fra: $fr2;gr: $gr;}" $color_theme_file


