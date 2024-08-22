#!/usr/bin/bash

bk='#30475E'
fr='#DDDDDD'
bk_alt='#222831'
fr_alt='#F05454'
gr=''#FF9800''

Workspaces() {
	desktops=$(bspc query -D --names)
  focused=$(bspc query -D --names -d focused)

	for desktop in $desktops; do
		desktop=$(echo "$desktop")
		nodes=$(bspc query -N -d $desktop)

		if [ ! -z "$nodes" ]; then
			desktops=$(echo $desktops | sed "s/$desktop/%{F$gr}$desktop%{F-}/")
    fi

  done
  desktops=$(echo $desktops | sed "s/$focused/%{B$bk}%{+u}_$focused\_%{-u}%{B-}/")

  echo $desktops | sed "s/_/ /g"
}


Clock(){
	TIME=$(date "+%H:%M")
	echo -e -n " \uf017 ${TIME}" 
}

Cal() {
    DATE=$(date "+%d, %b %y")
    echo -e -n "\uf073 ${DATE}"
}

# ActiveWindow(){
# 	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
# 	max_len=70
# 	if [ "$len" -gt "$max_len" ];then
# 		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
# 	else
# 		echo -n "$(xdotool getwindowfocus getwindowname)"
# 	fi
# }

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

Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "\uf028${VOL}"
		elif [ $VOL -ge 50 ] ; then
			echo -e "\uf027${VOL}"
		else
			echo -e "\uf026${VOL}"
		fi
	else
		echo -e "\ue04f"
	fi
}





while true; do

    workspaces_output="%{F$bk_alt}$(Workspaces)%{F-}"
    clock_output="%{F$clock_color}$(Clock)%{F-}"
    cal_output="%{F$cal_color}$(Cal)%{F-}"
    sound_output="%{B$fr}%{F$bk} $(Sound) %{F-}%{B-}"
    battery_output="%{B$bk}%{F$fr} $(get_battery_info)%{F-}%{B-}"

	echo -e "%{l}$workspaces_output" "%{c}" "%{r} $(Clock) $(Cal) $sound_output $battery_output"
	sleep 0.01s
done | lemonbar -p -B "#222831" -o -2 -f "NFS font-14" -o -1 -f "JetBrainsMonoNL Nerd Font-12"



# Main loop to manage Lemonbar visibility based on full-screen status
# while true; do
#     if is_fullscreen; then
#         pkill lemonbar
#     else
#         pgrep lemonbar > /dev/null || launch_lemonbar &
#     fi
#     sleep 1
# done