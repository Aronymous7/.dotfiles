xrdb ~/.Xresources
setxkbmap us -option "ctrl:nocaps,shift:both_capslock_cancel"
xset r rate 300 40

~/scripts/autostart.sh

exec xmonad
