#!/bin/bash

typeset -a files=(${XDG_PICTURE_HOME:-~/Pictures}/Wallpapers/ivan_shishkin/*)
typeset -i i=$((RANDOM % ${#files[@]}))

cp "${files[$i]}" ~/.wallpaper

if command -v magick; then
  magick ~/.wallpaper \
    -gravity center -crop 16:9 -scale 1920x1080 \
    -gravity northwest -region 640x1080+0+0 -blur 0x20 \
    -fill black -colorize 10% \
    +repage ~/.wallpaper-lock
else
  cp ~/.wallpaper{,-lock}
fi

if [[ $1 == --set ]]; then
  hyprctl hyprpaper unload ~/.wallpaper &>/dev/null \
    && hyprctl hyprpaper preload ~/.wallpaper &>/dev/null \
    && hyprctl hyprpaper wallpaper ,~/.wallpaper &>/dev/null
fi
