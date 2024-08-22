#!/bin/sh

alpha='00'
alpha2='66'
background='#282a36'
selection='#44475a'
comment='#6272a4'
font='#DDDDDD'

yellow='#f1fa8c'
orange='#ffb86c'
red='#ff5555'
magenta='#ff79c6'
blue='#6272a4'
cyan='#8be9fd'
green='50fa7b'
# trn = '#ffffff00'

i3lock \
  --insidever-color=$selection$alpha \
  --insidewrong-color=$selection$alpha \
  --inside-color=$selection$alpha \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ring-color=$blue$alpha \
  --line-uses-ring \
  --keyhl-color=$magenta$alpha \
  --bshl-color=$orange$alpha \
  --separator-color=$selection$alpha \
  --verif-color=$green \
  --wrong-color=$red \
  --modif-color=$red \
  --layout-color=$blue \
  --date-color=$font$alpha2 \
  --time-color=$font$alpha2 \
  --screen 1 \
  --blur 1 \
  --force-clock \
  --indicator \
  --time-str="%H:%M" \
  --date-str="%a %e %B %Y" \
  --verif-text="Checking..." \
  --wrong-text="Wrong pswd" \
  --noinput="No Input" \
  --lock-text="Locking..." \
  --lockfailed="Lock Failed" \
  --radius=120 \
  --ring-width=10 \
  --no-modkey-text \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  --image="/home/abhi/Pictures/Wallpapers/2024-Subaru-WRX-Project-Midnight-Concept-005-2160.jpg" \
  --fill \
  --time-font="NFS Font" \
  --date-font="NFS Font" \
  --layout-font="JetBrainsMono Nerd Font" \
  --verif-font="JetBrainsMono Nerd Font" \
  --wrong-font="JetBrainsMono Nerd Font" \
  --time-align=1 \
  --date-align=1 \
  --date-size=40 \
  --time-size=100 \
  --date-pos="250:1010" \
  --bar-pos="95:870" \
  --ind-pos="120:950"\
  --bar-base-width=130 \
  --bar-total-width=470 \
  --bar-max-height=300 \
  --bar-indicator \
  --bar-color=$background$alpha \
  --bar-step=2000 \
  --refresh-rate=120 \
  --bar-count=20000 \
  
  # --bar-direction=1 \
  #  --date-pos="250:1010" \
  # --time-pos="170:975" \
  # --pointer=win \
#  --layout-font="JetBrainsMono Nerd Font" \
#  --verif-font="JetBrainsMono Nerd Font" \
#  --wrong-font="JetBrainsMono Nerd Font" \

  # --no-verify \
