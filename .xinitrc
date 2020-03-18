xrdb ~/.Xresources
setxkbmap us -option "ctrl:swapcaps"
xset r rate 300 40

~/scripts/autostart.sh

exec xmonad
