import colors
from libqtile import layout

mylayouts = [
    layout.MonadWide(
    #    **layout_theme
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,   
       margin =  [10, 10, 10, 10],
    ),
    layout.Bsp(
    #    **layout_theme
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,
       border_focus = colors.changable['trn'],
       margin =  [10, 10, 10, 10],
    ),
    layout.Columns(
    #    **layout_theme
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,
       margin =  [10, 10, 10, 10],
    ),
    layout.Zoomy(
    #    **layout_theme
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,
       margin =  [10, 10, 10, 10],
    ),
    layout.MonadTall(
    #    **layout_theme
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,
       margin =  [10, 10, 10, 10],
    ),
    layout.Max(
    #    **layout_theme
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,
       margin =  [10, 10, 10, 10],
    ),
    layout.Floating(
    #    **layout_theme,
       border_focus = colors.changable['trn'],
       border_normal = colors.changable['trn'],
       border_width = 0,
       fullscreen_border_width = 0,
       max_border_width = 0,
       margin =  [10, 10, 10, 10],
    )
]