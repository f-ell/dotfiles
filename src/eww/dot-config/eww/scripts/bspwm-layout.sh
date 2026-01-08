#!/usr/bin/bash

function layout {
  [[ `bspc query --tree --desktop` =~ '"layout":"'(monocle|tiled)'"' ]]
  printf "%s\n" ${BASH_REMATCH[1]:0:1}
}

layout

while read; do
  layout
done < <(bspc subscribe desktop_focus desktop_layout)
