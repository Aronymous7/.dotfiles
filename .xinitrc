xrdb ~/.Xresources
setxkbmap de -option "lv3:caps_switch,shift:both_capslock"
xset r rate 300 40

~/scripts/autostart.sh

exec xmonad
