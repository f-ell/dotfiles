#!/usr/bin/bash

function desktops {
  declare -a obj

  for d in `bspc query -D --names`; do
    declare state
    declare -i occupied

    bspc query -D -d $d.occupied >/dev/null
    occupied=$?
    (( $occupied == 0 )) && state='occupied' || state='empty'

    bspc query -D -d $d.focused >/dev/null
    (( $? == 0 )) && state='focused'

    obj+=("{\"id\":\"$d\",\"icon\":\"${d:0:1}\",\"state\":\"$state\",\"command\":\"bspc desktop -f $d\"}")
  done

  declare IFS=,
  printf '[%s]\n' "${obj[*]}"
}

desktops

while read; do
  desktops
done < <(bspc subscribe desktop_{add,focus,remove,transfer} node_{add,remove,transfer})
