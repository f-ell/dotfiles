#!/bin/sh

xinput set-prop "DLL07D1:01 044E:120B" "libinput Tapping Enabled" 1
setxkbmap de
xsetroot -cursor_name left_ptr
xset r rate 200 75

exec bspwm
