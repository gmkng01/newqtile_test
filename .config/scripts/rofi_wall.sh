#!/bin/bash

# Function to set wallpaper using Nitrogen
set_wallpaper() {
    # Check if Nitrogen is installed
    if ! command -v nitrogen &>/dev/null; then
        echo "Nitrogen is not installed. Please install it first."
        exit 1
    fi
    
    # Set the wallpaper using Nitrogen
    nitrogen --set-scaled "$1"
}

# Define the folder path
folder=~/Pictures/wall


# Use rofi to select an image
selected_file=$(ls "$folder" | while read A ; do  echo -en "$A\x00icon\x1f~/Pictures/wall/$A\n" ; done | rofi -dmenu -theme ~/.config/rofi/launchers/type-1/style-7.rasi)

# Set the selected image as wallpaper using Nitrogen
set_wallpaper "$folder/$selected_file"
