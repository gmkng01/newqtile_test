#!/usr/bin/env bash

alpha='40'
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
  --blur 3 \
  --force-clock \
  --indicator \
  --time-str="%H %M" \
  --date-str="%a %e %B %Y" \
  --verif-text="Checking..." \
  --wrong-text="Wrong pswd" \
  --noinput="No Input" \
  --lock-text="Locking..." \
  --lockfailed="Lock Failed" \
  --no-modkey-text \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  --image="/home/abhi/Pictures/walls/jhxo81zd70ee1.jpeg" \
  --fill \
  --time-font="NFS Font" \
  --date-font="NFS Font" \
  --layout-font="NFS Font" \
  --verif-font="NFS Font" \
  --wrong-font="NFS Font" \
  --time-align=1 \
  --date-align=1 \
  --date-size=50 \
  --time-size=110 \
  --time-pos="120:942" \
  --date-pos="115:980" \
  --bar-pos="95:860" \
  --ind-pos="540:942"\
  --bar-base-width=130 \
  --bar-total-width=700 \
  --bar-max-height=300 \
  --bar-indicator \
  --bar-color=$background$alpha \
  --bar-step=2000 \
  --refresh-rate=1 \
  --bar-count=20000 \
  
  # --bar-direction=1 \
  # --pointer=win \
  # --no-verify \
  # --radius=120 \ 
