#!/usr/bin/env bash

config="/home/$USER/.config/qtile/func_var.py"
tray = "trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x2C3333 --margin 0 --distance 0 --distancefrom top"

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
# choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p -theme ~/.config/rofi/launchers/type-1/style-2.rasi)
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p -theme ~/.config/rofi/themes.rasi)


case $choice in
    'Darks')
        sed -i '/co =/c\co = colors.darks' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x2C3333 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;        

    'Black')
        sed -i '/co =/c\co = colors.black' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x000000 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Snow with Ash')
        sed -i '/co =/c\co = colors.snow_with_ash' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x747C8C --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Vintage')
        sed -i '/co =/c\co = colors.vintage' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x43766C --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Dark Night')
        sed -i '/co =/c\co = colors.dark_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x30475E --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Vintage Dark')
        sed -i '/co =/c\co = colors.vintage_dark' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x2C061F --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Gray Space')
        sed -i '/co =/c\co = colors.gray_space' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x222831 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Yellow Night')
        sed -i '/co =/c\co = colors.yellow_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x000000 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Halloween')
        sed -i '/co =/c\co = colors.halloween' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x222831 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'White & Gray')
        sed -i '/co =/c\co = colors.gray_sky' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0xD9D9D9 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Full Gray')
        sed -i '/co =/c\co = colors.full_gray' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x737373 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Space Night')
        sed -i '/co =/c\co = colors.space_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x2F3032 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Star Night')
        sed -i '/co =/c\co = colors.star_night' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x303841 --margin 0 --distance 0 --distancefrom top && ~/.config/rofi/color_changer.sh &;;

    'Black Gray')
        sed -i '/co =/c\co = colors.black_gray' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x262626 --margin 0 --distance 0 --distancefrom top && ./~/.config/rofi/color_changer.sh &;;

    'Dark Sky2')
        sed -i '/co =/c\co = colors.dark_sky2' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x0A0F15 --margin 0 --distance 0 --distancefrom top && source ./color_changer.sh &;;
    
    'Light Chocalate')
        sed -i '/co =/c\co = colors.light_chocalate' $config && qtile cmd-obj -o cmd -f restart && killall trayer && trayer --transparent true --width 5 --edge top --align right --alpha 0 --tint 0x4F5F73 --margin 0 --distance 0 --distancefrom top && source ./color_changer.sh &;;

    'Choose According to the wallpaper')
        sed -i '/co =/c\co = cp.wall_color' $config && qtile cmd-obj -o cmd -f restart && source ./color_changer.sh &;;


    'quit')
        echo "No theme chosen" && exit 1 ;;
esac


