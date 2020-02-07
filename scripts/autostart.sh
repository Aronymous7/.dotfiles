#!/bin/bash
nitrogen --restore &
[[ -z $(pgrep xss-lock) ]] && xss-lock -- i3lock -n -c 000000 &
[[ -z $(pgrep syncthing) ]] && syncthing -no-browser &
[[ -z $(pgrep unclutter) ]] && unclutter &
[[ -z $(pgrep devmon) ]] && devmon &
