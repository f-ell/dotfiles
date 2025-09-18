#!/bin/bash

typeset -a files=(${XDG_PICTURE_HOME:-~/Pictures}/Wallpapers/ivan_shishkin/*)
typeset -i i=$((RANDOM % ${#files[@]}))

cp "${files[$i]}" ~/.wallpaper

if [[ $1 == --set ]]; then
  hyprctl hyprpaper unload ~/.wallpaper &>/dev/null \
    && hyprctl hyprpaper preload ~/.wallpaper &>/dev/null \
    && hyprctl hyprpaper wallpaper ,~/.wallpaper &>/dev/null
fi
