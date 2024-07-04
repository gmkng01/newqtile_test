#!/usr/bin/env bash

config="/home/$USER/.config/qtile/func_var.py"

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
..............................
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p -theme ~/.config/rofi/launchers/type-1/style-2.rasi)

case $choice in
    'Darks')
        sed -i '/co =/c\co = colors.darks' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x2C3333 --margin 10 --distance 10 --distancefrom top &;;        

    'Black')
        sed -i '/co =/c\co = colors.black' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x000000 --margin 10 --distance 10 --distancefrom top &;;

    'Snow with Ash')
        sed -i '/co =/c\co = colors.snow_with_ash' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x747C8C --margin 10 --distance 10 --distancefrom top &;;

    'Vintage')
        sed -i '/co =/c\co = colors.vintage' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x43766C --margin 10 --distance 10 --distancefrom top &;;

    'Dark Night')
        sed -i '/co =/c\co = colors.dark_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x30475E --margin 10 --distance 10 --distancefrom top &;;

    'Vintage Dark')
        sed -i '/co =/c\co = colors.vintage_dark' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x2C061F --margin 10 --distance 10 --distancefrom top &;;

    'Gray Space')
        sed -i '/co =/c\co = colors.gray_space' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x222831 --margin 10 --distance 10 --distancefrom top &;;

    'Yellow Night')
        sed -i '/co =/c\co = colors.yellow_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x000000 --margin 10 --distance 10 --distancefrom top &;;

    'Halloween')
        sed -i '/co =/c\co = colors.halloween' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x222831 --margin 10 --distance 10 --distancefrom top &;;

    'White & Gray')
        sed -i '/co =/c\co = colors.gray_sky' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0xD9D9D9 --margin 10 --distance 10 --distancefrom top &;;

    'Full Gray')
        sed -i '/co =/c\co = colors.full_gray' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x737373 --margin 10 --distance 10 --distancefrom top &;;

    'Space Night')
        sed -i '/co =/c\co = colors.space_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x2F3032 --margin 10 --distance 10 --distancefrom top &;;

    'Star Night')
        sed -i '/co =/c\co = colors.star_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x303841 --margin 10 --distance 10 --distancefrom top &;;

    'Black Gray')
        sed -i '/co =/c\co = colors.black_gray' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x262626 --margin 10 --distance 10 --distancefrom top &;;

    'Dark Sky2')
        sed -i '/co =/c\co = colors.dark_sky2' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x0A0F15 --margin 10 --distance 10 --distancefrom top &;;
    
    'Light Chocalate')
        sed -i '/co =/c\co = colors.light_chocalate' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x4F5F73 --margin 10 --distance 10 --distancefrom top &;;

    'Choose According to the wallpaper')
        sed -i '/co =/c\co = cp.wall_color' $config && qtile cmd-obj -o cmd -f restart &;;


    'quit')
        echo "No theme chosen" && exit 1 ;;
esac


