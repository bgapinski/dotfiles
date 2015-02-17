#!/bin/bash

compton -GCcfb --focus-exclude 'class_g = "dmenu"' -o 0.8 -i 0.5 --focus-exclude 'class_g = "xlock"' --mark-ovredir-focused

xsetroot -cursor_name left_ptr
xcape -e "Control_L=Escape"

unclutter -grab &

xflux -z 11217
/usr/bin/xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &

touchegg &

exec xmonad
