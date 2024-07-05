import colors, os
import Color_picker as cp

home = os.path.expanduser('~')

co = cp.wall_color
fix = colors.changable

bk = co['bk']
fr = co['fr']
bk2 = co['bk2']
fr2 = co['fr2']
gr = co['gr']

trn = fix['trn']
urgent = fix['dark_red']

widget_font = 'NFS font'
widget_font_symbols = 'JetBrainsMono Nerd Font Mono Italic'

va = {
    "browser" :                 "firefox",
    "trml":                     "terminator",
    "code":                   "emacsclient -c -a 'emacs'",
    "rofi_menu":                "rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-7.rasi",
    "rofi_windows":             "rofi -show window -theme ~/.config/rofi/launchers/type-1/style-7.rasi",
    "rofi_file":                "rofi -show filebrowser -theme ~/.config/rofi/launchers/type-1/style-7.rasi",
    "wall":                     "sxiv -t ~/Pictures/wall",
    "file_manager":             "nemo",
    "bluetooth":                "blueman-manager",
    "theme_changer":            f"{home}/.config/qtile/scripts/theme_changer.sh",
    "vol_mute":                 f"{home}/.config/qtile/scripts/vol.sh mute",
    "vol_down":                 f"{home}/.config/qtile/scripts/vol.sh down",
    "vol_up":                   f"{home}/.config/qtile/scripts/vol.sh up",
    "bright_up":                f"{home}/.config/qtile/scripts/bright.sh up",
    "bright_down":              f"{home}/.config/qtile/scripts/bright.sh down",
    "shutdown":                 f"{home}/.config/qtile/scripts/shutdown_confirm.sh",
    "reboot":                   f"{home}/.config/qtile/scripts/reboot_confirm.sh",
    "suspend":                  f"{home}/.config/qtile/scripts/suspend_confirm.sh",
    "power_menu":               f'{home}/.config/rofi/powermenu/type-1/powermenu.sh',
    "screenshot_full":          'sh -c "xfce4-screenshooter --fullscreen --clipboard --save ~/Pictures/Screenshots/Screenshot_$(date +\'%Y-%m-%d_%H:%M:%S\').png"',
    "screenshot_window":        'sh -c "xfce4-screenshooter -w --clipboard --save ~/Pictures/Screenshots/Screenshot_$(date +\'%Y-%m-%d_%H:%M:%S\').png"',
    "screenshot_region":        'sh -c "xfce4-screenshooter -r --clipboard --save ~/Pictures/Screenshots/Screenshot_$(date +\'%Y-%m-%d_%H:%M:%S\').png"',
    "screenshot_gui":           "xfce4-screenshooter",
    "trayer":                   f"killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x{bk[1::]} --margin 10 --distance 10 --distancefrom top"
    }

vriable = va

