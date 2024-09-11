import colors, os
import Color_picker as cp
# import subprocess

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
widget_font_symbols = 'JetBrainsMono Nerd Font Italic'


# Template for the Rofi config file
rasi_template = """
/* Rofi Color Theme */
* {{
    bg: {bk};
    fg: {fr};
    bga: {bk2};
    fga: {fr2};
    gr: {gr};
}}
"""

rasi_content = rasi_template.format(
   bk=bk,
   fr=fr,
   bk2=bk2,
   fr2=fr2,
   gr=gr
)

# Determine the path to the config.rasi file
home = os.path.expanduser('~')
config_rasi_path = os.path.join(home, '.config', 'rofi', 'color.rasi')

# Ensure the directory exists
os.makedirs(os.path.dirname(config_rasi_path), exist_ok=True)

# Write the formatted content to the config.rasi file
with open(config_rasi_path, 'w') as f:
   f.write(rasi_content)


va = {
    "browser" :                 "firefox",
    "trml":                     "terminator",
    "code":                     f"{home}/.config/qtile/scripts/VScode_transparent.sh",
    # "rofi_menu":                "rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-7.rasi",
    # "rofi_windows":             "rofi -show window -theme ~/.config/rofi/launchers/type-1/style-7.rasi",
    # "rofi_file":                "rofi -show filebrowser -theme ~/.config/rofi/launchers/type-1/style-7.rasi",
    "rofi_menu":                "rofi -show drun",
    "rofi_windows":             "rofi -show window",
    "rofi_file":                "rofi -show filebrowser",
    "wall":                     "sxiv -t ~/Pictures/wall",
    "file_manager":             "pcmanfm",
    "bluetooth":                "blueman-manager",
    "theme_changer":            f"{home}/.config/qtile/scripts/theme_changer.sh",
    "vol_mute":                 f"{home}/.config/scripts/vol.sh mute",
    "vol_down":                 f"{home}/.config/scripts/vol.sh down",
    "vol_up":                   f"{home}/.config/scripts/vol.sh up",
    "bright_up":                f"{home}/.config/scripts/bright.sh up",
    "bright_down":              f"{home}/.config/scripts/bright.sh down",
    "shutdown":                 f"{home}/.config/scripts/shutdown_confirm.sh",
    "reboot":                   f"{home}/.config/scripts/reboot_confirm.sh",
    "suspend":                  f"{home}/.config/scripts/suspend_confirm.sh",
    "power_menu":               f'{home}/.config/rofi/powermenu/type-1/powermenu.sh',
    "screenshot_full":          'sh -c "xfce4-screenshooter --fullscreen --clipboard --save ~/Pictures/Screenshots/Screenshot_$(date +\'%Y-%m-%d_%H:%M:%S\').png"',
    "screenshot_window":        'sh -c "xfce4-screenshooter -w --clipboard --save ~/Pictures/Screenshots/Screenshot_$(date +\'%Y-%m-%d_%H:%M:%S\').png"',
    "screenshot_region":        'sh -c "xfce4-screenshooter -r --clipboard --save ~/Pictures/Screenshots/Screenshot_$(date +\'%Y-%m-%d_%H:%M:%S\').png"',
    "screenshot_gui":           "xfce4-screenshooter",
    "trayer":                   f"killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x{bk[1::]} --margin 10 --distance 10 --distancefrom top",
    "lock_screen":              f"{home}/.config/i3lock/lock.sh"
    # "lock_screen":              "betterlockscreen -l"
    }

vriable = va

