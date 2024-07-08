from libqtile import  widget
# from libqtile import qtile
from func_var import vriable
from libqtile.bar import Bar
from libqtile.lazy import lazy
from battery import BatteryWidget
from libqtile.config import Group, Match, Screen
from func_var import bk, fr, bk2, fr2, gr, trn, urgent  ## Colors
from func_var import widget_font, widget_font_symbols, home  ## Font

from qtile_extras import  widget as xwidget

# from test import NumLockIndicator

mybar = [Screen
         (top = Bar
          (
              [
                widget.TextBox(
                        text='ё',
                        background = bk,
                        foreground = fr,
                        fontsize = 25,
                        # mouse_callbacks = {'Button1': rofi_menu,},
                        padding = 4,  
                        font = widget_font,
                        # **arrow_powerlineLeft                
                        ),
                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk2,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),
                widget.GroupBox(
                        font="Symbols Nerd Font",
                        fontsize=28,
                        margin_y=3,
                        margin_x=0,
                        padding_y=8,
                        padding_x=3,
                        borderwidth=3.5,
                        active=gr,
                        block_highlight_text_color = fr2,
                        inactive=gr,
                        rounded=True,
                        hide_unused="true",
                        highlight_method="line",
                        highlight_color = bk2,
                        urgent_alert_method="block",
                        urgent_border=urgent,
                        background = bk2,
                        disable_drag=True, 
                        # **arrow_powerlineLeft                     
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk,
                        foreground = bk2,
                        padding = 0,
                        fontsize = 30
                        ),
                                
                widget.CurrentLayout(
                        fmt = '{} ',
                        background=bk,
                        foreground=fr,
                        font = widget_font,
                        fontsize = 19
                        ),
                
                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk2,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.WindowCount(
                        text_format=' {num}  ',
                        background=bk2,
                        foreground=fr2,
                        show_zero=True,
                        font = widget_font,
                        fontsize = 19,
                        mouse_callbacks = {'Button1':lazy.layout.next()}
                        ),                    
                        
                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk2,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                # NumLockIndicator(
                #         font = widget_font,
                #         fontsize = 19,
                #         # max_chars = 14,
                #         padding = 5,
                #         # prefix = 100
                #         width = 200,
                #         foreground = fr,
                #         background =  bk
                # ),


                widget.Spacer(
                        background = trn,
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk2,
                        padding = 0,
                        fontsize = 30
                        ),                
                        
                widget.WidgetBox(
                        font = 'Algol',
                        fontsize = 50,
                        text_closed = '«',
                        text_open = "»",
                        background = bk2,
                        foreground = fr2,
                        widgets=[
                                widget.TextBox(
                                        text = '',
                                        font = widget_font_symbols,
                                        background = bk2,
                                        foreground = bk,
                                        padding = 0,
                                        fontsize = 30
                                        ),
                                widget.Net(
                                        format = '« {down} » {up}   ',
                                        font = widget_font,
                                        fontsize = 19,
                                        # max_chars = 14,
                                        padding = 5,
                                        # prefix = 100
                                        width = 200,
                                        foreground = fr,
                                        background =  bk
                                        ),
                                widget.TextBox(
                                        text = '',
                                        font = widget_font_symbols,
                                        background = bk2,
                                        foreground = bk,
                                        padding = 0,
                                        fontsize = 30
                                        ),
                                widget.Memory(
                                        fmt = "{}",
                                        font = widget_font,
                                        fontsize = 18,
                                        width = 165,
                                        foreground = fr2,
                                        background = bk2
                                        ),
                                ]                                        
                        ), 

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk2,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.Clock(
                        font = widget_font,
                        foreground = fr,
                        background =  bk,
                        fontsize = 18,
                        format=' %d %b %a - %H:%M  ',                           
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk2,
                        foreground = bk,
                        padding = 0,
                        fontsize = 30
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk2,
                        foreground = fr,
                        padding = 0,
                        fontsize = 30
                        ),                

                BatteryWidget(
                        font=widget_font,
                        fontsize=18,
                        background=fr,
                        foreground = bk,
                        low_battery_script=f"{home}/.config/qtile/scripts/battery_low.sh"
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk,
                        foreground = fr,
                        padding = 0,
                        fontsize = 30
                        ),

                xwidget.Bluetooth(
                        background = bk,
                        foreground = fr,
                        default_text = '󰂯 ',
                        fontsize = 18,
                        device_battery_format = ' ({battery}%)',
                        device_format = 'Device: {name}{battery_level} [{symbol}]',
                        highlight_colour = fr,
                        menu_background = bk,
                        menu_font = widget_font,
                        menu_fontsize = 15,
                        menu_offset_x = -10,
                        menu_offset_y = 0,
                        menu_width = 300,
                        mouse_callbacks = {'Button1': lazy.spawn('blueman-manager'), 'Button2': lazy.spawn('blueman-adapters')},
                        # opacity = 0.9,
                        # scroll = True,
                ), 
                                                
                ],
                background=trn, size=26, margin=[0, 85, 0, 0],
        )
        )
]
mygroup = [
    Group('1', label="", matches = [Match(wm_class = vriable['browser'])]),
    Group('2', label="", matches = [Match(wm_class = vriable["code"])]),
    Group('3', label=""), 
    Group('4', label="",matches = [Match(wm_class = vriable['file_manager'])]),
    Group('5', label="󰊠", matches = [Match(wm_class = "discord"), Match(wm_class="TelegramDesktop")]),
    Group('6', label=""),
    Group('7', label=""),
    Group('8', label=""),
    ]
