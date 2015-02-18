#!/bin/bash

compton --config ~/.compton.conf -b

xsetroot -cursor_name left_ptr
xcape -e "Control_L=Escape"

unclutter -grab &

xflux -z 11217
/usr/bin/xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &

touchegg &

exec xmonad
