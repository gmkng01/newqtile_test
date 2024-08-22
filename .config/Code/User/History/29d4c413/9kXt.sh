#!/usr/bin/env bash

# Current Theme
theme='/home/abhi/.config/rofi/theme'


yes='✓ Yes'
no='󰛉  No'

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ]; font: "NFS Font Regular 13";}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Suspend  ?' \
		-theme ${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$suspend" | rofi_cmd
}

run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
		systemctl suspend
		~/.config/i3lock/lock.sh
    else
        exit 0
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $reboot)
        run_cmd --suspend
esac





# #!/usr/bin/env bash

# # Current Theme
# # dir="$HOME/.config/rofi/powermenu/type-1"
# theme='/home/abhi/.config/rofi/theme'


# yes='✓ Yes'
# no='󰛉  No'

# # Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 210px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ]; font: "NFS Font Regular 13";}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Suspend  ?' \
		-theme ${theme}.rasi
}

# # Ask for confirmation
# confirm_exit() {
# 	echo -e "$yes\n$no" | confirm_cmd
# }

# # Pass variables to rofi dmenu
# run_rofi() {
# 	echo -e "$shutdown" | rofi_cmd
# }

# run_cmd() {
#     selected="$(confirm_exit)"
#     if [[ "$selected" == "$yes" ]]; then
#         systemctl poweroff
#     else
#         exit 0
#     fi
# }

# # Actions
# chosen="$(run_rofi)"
# case ${chosen} in
#     $shutdown)
#         run_cmd --shutdown
# esac

