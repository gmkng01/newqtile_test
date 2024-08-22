import os
from func_var import vriable, bk, minimize_focused_window, restore_minimized_window 
from MyBars import mygroup
from subprocess import Popen
from libqtile.lazy import lazy
from libqtile.config import Key, Click, Drag

home = os.path.expanduser('~')

def trayer():
    tr = f'killall trayer && trayer --transparent true --width 4 --edge top --align right --alpha 0 --tint 0x{bk[1::]} --margin 10 --distance 10 --distancefrom top'    
    Popen(tr, shell=True)

mykeys = [
        ### The essentials launches
        Key(["mod4"], "Return", lazy.spawn(vriable['trml']), 
            desc='Launches My Terminal'),
    
        Key(["mod1", "shift"], "c", lazy.spawn("google-chrome-stable"), 
            desc='Launches My Chrome'),

        Key(["mod1", "shift"], "n", lazy.spawn("terminator -e nmtui"), 
            desc='NetworkManager Tools'),

        Key(["mod4", "shift"], "Return", lazy.spawn(vriable['rofi_menu']), 
            desc='Run Launcher Menu'),

        Key(["mod4", "shift"], "w", lazy.spawn(vriable['rofi_windows']), 
            desc = "Launchs Rofi window launcher"),
        
        Key(["mod4", "shift"], "n", lazy.spawn(vriable['rofi_file']), 
            desc = "Launchs Rofi FileBrowser launcher"),

        Key(["mod1"], "p", lazy.spawn("sxiv -t ~/Pictures/wall"), 
            desc = "Wallpaper Changer"),

        Key(["mod1"], "f", lazy.spawn(vriable["browser"]), 
            desc='Firefox'),

        Key(["mod1"], "d", lazy.spawn("discord"), 
            desc='Discord'),

        Key(["mod1"], "t", lazy.spawn("telegram-desktop"), 
            desc='Telegram'),

        Key(["mod1"], "c", lazy.spawn(vriable['code'] "&& bash -c 'for W in $(wmctrl -l |grep "Visual Studio Code" |awk '"'"'{print $1}'"'"'); do xprop -id $W -format _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * 95 / 100))); done'"), 
            desc='VS vscodium'),

        Key(["mod1"], "n", lazy.spawn(vriable['file_manager']), 
            desc='File Manager'),

        Key(["mod1"], "b", lazy.spawn(vriable["bluetooth"]), 
            desc='blueman-manager'),   
       
        
        ### System controls
        Key(["mod4"], "Tab", lazy.next_layout(), 
            desc='Toggle through layouts'),

        Key(["mod1"], "q", lazy.window.kill(), 
            desc='Kill active window'),

        Key(["mod4"], "r", lazy.reload_config(), 
            desc='Restart Qtile'),

        Key(["mod4"], "l", lazy.spawn(vriable["lock_screen"]),
            desc='Screen Lock'),

        Key(["mod4", "shift"], "q", lazy.shutdown(), 
            desc='Logout'),

        Key(["mod4", "shift"], "x", lazy.spawn(vriable["shutdown"]),
            desc='Shut Down'),

        Key(["mod4", "shift"], "r", lazy.spawn(vriable["reboot"]),
            desc='Reboot'),

        Key(["mod4", "shift"], "s", lazy.spawn(vriable["suspend"]), 
            desc='System Suspend'),

        Key(["mod4", "shift"], "d", lazy.spawn(vriable["power_menu"])),

        Key(["mod4", "shift"], "t",lazy.spawn(vriable["theme_changer"]),
            desc="Cycle through colors"),

        ### Window controls
        Key(["mod4", "shift"], "o", 
            lazy.window.toggle_maximize()
            ),
        Key(["mod4", "shift"], "i", 
            lazy.window.toggle_minimize()
            ),

        # Key(["mod4", "shift"], "o", lazy.function(minimize_focused_window)),
    
        # # Restore minimized windows
        # Key(["mod4", "shift"], "i", lazy.function(restore_minimized_window)),


        Key(["mod4"], "j",
            lazy.layout.down(),
            desc='Move focus down in current stack pane'
            ),
        Key(["mod4"], "k",
            lazy.layout.up(),
            desc='Move focus up in current stack pane'
            ),
        Key(["mod4", "shift"], "j",
            lazy.layout.shuffle_down(),
            lazy.layout.section_down(),
            desc='Move windows down in current stack'
            ),
        Key(["mod4", "shift"], "k",
            lazy.layout.shuffle_up(),
            lazy.layout.section_up(),
            desc='Move windows up in current stack'
            ),
        Key(["mod4"], "h",
            lazy.layout.shrink(),
            lazy.layout.decrease_nmaster(),
            desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
            ),
        Key(["mod4", "shift"], "l",
            lazy.layout.grow(),
            lazy.layout.increase_nmaster(),
            desc='Expand window (MonadTall), increase number in master pane (Tile)'
            ),
        Key(["mod4"], "n",
            lazy.layout.normalize(),
            desc='normalize window size ratios'
            ),
        Key(["mod4"], "m",
            lazy.layout.maximize(),
            desc='toggle window between minimum and maximum sizes'
            ),
        Key(["mod4", "shift"], "f",
            lazy.window.toggle_floating(),
            desc='toggle floating'
            ),
        Key(["mod4"], "f",
            lazy.window.toggle_fullscreen(),
            desc='toggle fullscreen'
            ),
        Key(["mod4", "shift"], "Tab",
            lazy.layout.rotate(),
            lazy.layout.flip(),
            desc='Switch which side main pane occupies (XmonadTall)'
            ),
        Key(["mod1"], "Tab",
            lazy.layout.next(),
            desc='Switch window focus to other pane(s) of stack'
            ),
        Key(["mod4", "shift"], "space",
            lazy.layout.toggle_split(),
            desc ='Toggle between split and unsplit sides of stack'
            ),
         
        # Sound       
        Key([], "XF86AudioMute", lazy.spawn(vriable["vol_mute"])),

        Key([], "XF86AudioLowerVolume", lazy.spawn(vriable["vol_down"])),

        Key([], "XF86AudioRaiseVolume", lazy.spawn(vriable["vol_up"])),

        # Brightness
        Key([], 'XF86MonBrightnessUp', lazy.spawn(vriable["bright_up"])),

        Key([], 'XF86MonBrightnessDown', lazy.spawn(vriable["bright_down"])),
        
        # ScreenShots
        Key([], "Print", lazy.spawn(vriable["screenshot_full"])),

        Key(["control"], "Print", lazy.spawn(vriable["screenshot_region"])),

        Key(["control", "mod4"], "Print", lazy.spawn(vriable["screenshot_window"])),

        Key(["control", "shift"], "Print", lazy.spawn("xfce4-screenshooter")),

]

for i in mygroup:
    mykeys.extend(
        [
            Key(["mod4"],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(["mod4", "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

mymouse = [
            Drag(["mod4"], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
            Drag(["mod4"], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
            Click(["mod4"], "Button2", lazy.window.bring_to_front())
            ]

