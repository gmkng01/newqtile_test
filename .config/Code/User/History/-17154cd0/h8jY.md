# My linux



## Use find:

find . -name "foo*"

find needs a starting point, so the . (dot) points to the current directory.

If you need case insensitive search use :

find . -iname "foo*"

## Command for make VScode Transparent
``` bash -c 'for W in $(wmctrl -l |grep "Visual Studio Code" |awk '"'"'{print $1}'"'"'); do xprop -id $W -format _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * 95 / 100))); done' ```

