#!/bin/bash

checkVol=`pacmd list-sinks | grep "front-left" | head -1 | awk '{ print $5 }' | sed 's/%//g'`
action="$1"
if [ -z $action ]; then
  exit 0
elif [ $action = "inc" ]; then
  icon="status/audio-volume-high-symbolic"
  if [ $(($checkVol+5)) -le 100 ]; then
    pactl set-sink-volume 0 +5%
  fi
elif [ $action = "dec" ]; then
  icon="status/audio-volume-low-symbolic"
  if [ $(($checkVol-5)) -ge 0 ]; then
    pactl set-sink-volume 0 -5%
  fi
fi
volume=`pacmd list-sinks | grep "front-left" | head -1 | awk '{ print $5 }'`
#dunstify -h int:transient:1 -t 1000 -i $icon "Volume: $volume"
notify-send -h int:transient:1 -t 1000 -i $icon "Volume: $volume"
#~/Scripts/notify.sh "Speaker status" "Speaker volume: $volume" "/usr/share/icons/Adwaita/32x32/$icon.symbolic.png" 2 update
