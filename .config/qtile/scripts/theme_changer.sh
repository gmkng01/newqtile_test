#!/usr/bin/env bash

config="/home/$USER/.config/qtile/func_var.py"
tray = "trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x2C3333 --margin 0 --distance 0 --height 22 --distancefrom top"

declare -a options=(
"Darks"
"Black"
"Snow with Ash"
"Vintage"
"Dark Night"
"Vintage Dark"
"Gray Space"
"Yellow Night"
"Halloween"
"White & Gray"
"Full Gray"
"Space Night"
"Star Night"
"Black Gray"
"Dark Sky2"
"Light Chocalate" 
"Choose According to the wallpaper"
)

DARKS='\033[0;34m' 
# ..............................
# choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p -theme ~/.config/rofi/launchers/type-1/style-2.rasi)
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p -theme ~/.config/rofi/themes.rasi)


case $choice in
    'Darks')
        sed -i '/co =/c\co = colors.darks' $config && qtile cmd-obj -o cmd -f restart  &;;        

    'Black')
        sed -i '/co =/c\co = colors.black' $config && qtile cmd-obj -o cmd -f restart &;;

    'Snow with Ash')
        sed -i '/co =/c\co = colors.snow_with_ash' $config && qtile cmd-obj -o cmd -f restart &;;

    'Vintage')
        sed -i '/co =/c\co = colors.vintage' $config && qtile cmd-obj -o cmd -f restart  &;;

    'Dark Night')
        sed -i '/co =/c\co = colors.dark_night' $config && qtile cmd-obj -o cmd -f restart &;;

    'Vintage Dark')
        sed -i '/co =/c\co = colors.vintage_dark' $config && qtile cmd-obj -o cmd -f restart &;;

    'Gray Space')
        sed -i '/co =/c\co = colors.gray_space' $config && qtile cmd-obj -o cmd -f restart &;;

    'Yellow Night')
        sed -i '/co =/c\co = colors.yellow_night' $config && qtile cmd-obj -o cmd -f restart &;;

    'Halloween')
        sed -i '/co =/c\co = colors.halloween' $config && qtile cmd-obj -o cmd -f restart &;;

    'White & Gray')
        sed -i '/co =/c\co = colors.gray_sky' $config && qtile cmd-obj -o cmd -f restart &;;

    'Full Gray')
        sed -i '/co =/c\co = colors.full_gray' $config && qtile cmd-obj -o cmd -f restart &;;

    'Space Night')
        sed -i '/co =/c\co = colors.space_night' $config && qtile cmd-obj -o cmd -f restart &;;

    'Star Night')
        sed -i '/co =/c\co = colors.star_night' $config && qtile cmd-obj -o cmd -f restart &;;

    'Black Gray')
        sed -i '/co =/c\co = colors.black_gray' $config && qtile cmd-obj -o cmd -f restart &;;

    'Dark Sky2')
        sed -i '/co =/c\co = colors.dark_sky2' $config && qtile cmd-obj -o cmd -f restart &;;
    
    'Light Chocalate')
        sed -i '/co =/c\co = colors.light_chocalate' $config && qtile cmd-obj -o cmd -f restart &;;

    'Choose According to the wallpaper')
        sed -i '/co =/c\co = cp.wall_color' $config && qtile cmd-obj -o cmd -f restart && source ./color_changer.sh  &;;


    'quit')
        echo "No theme chosen" && exit 1 ;;
esac

sleep 1 

 ~/.config/qtile/trayer.py
