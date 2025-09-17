#!/bin/bash

typeset -a files=(${XDG_PICTURE_HOME:-~/Pictures}/Wallpapers/ivan_shishkin/*)
typeset -i i=$((RANDOM % ${#files[@]}))

cp "${files[$i]}" ~/.wallpaper
