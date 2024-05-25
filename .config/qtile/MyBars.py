from libqtile import  widget
from func_var import vriable
from libqtile.bar import Bar
from libqtile.lazy import lazy
from battery import BatteryWidget
from libqtile.config import Group, Match, Screen
from func_var import bk, fr, bk2, fr2, gr, trn, urgent  ## Colors
from func_var import widget_font, widget_font_symbols, home  ## Font


# wall = 

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
                        font = widget_font                     
                        ),
                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk2,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
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
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk,
                        foreground = bk2,
                        padding = 0,
                        fontsize = 22
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
                        fontsize = 22
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
                        fontsize = 22
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
                        ),

                        widget.Spacer(
                                background = trn,
                                ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk2,
                        padding = 0,
                        fontsize = 22
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
                                        fontsize = 22
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
                                        fontsize = 25
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
                        fontsize = 22
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = trn,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
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
                        fontsize = 25
                        ),

                widget.TextBox(
                        text = '',
                        font = widget_font_symbols,
                        background = bk2,
                        foreground = bk,
                        padding = 0,
                        fontsize = 22
                        ),

                BatteryWidget(
                        font=widget_font,
                        fontsize=18,
                        background=bk,
                        foreground = fr,
                        low_battery_script=f"{home}/.config/qtile/scripts/battery_low.sh"
                        )   
                                                
                ],
                background=trn, size=26, margin=[10, 85, 0, 10],
        )
        )
]
mygroup = [
    Group('1', label="", matches = [Match(wm_class = vriable['browser'])],layout='bsp'),
    Group('2', label="󰘐", matches = [Match(wm_class = vriable["vscode"])],layout='max'),
    Group('3', label="󰨊", layout='bsp'), 
    Group('4', label="",matches = [Match(wm_class = vriable['file_manager'])], layout='bsp'),
    Group('5', label="󰊠", matches = [Match(wm_class = "discord"), Match(wm_class="TelegramDesktop")], layout='bsp'),
    Group('6', label="", layout='bsp'),
    Group('7', label="", layout='bsp'),
    Group('8', label="", layout='bsp'),
    ]