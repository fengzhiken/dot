#!/bin/bash

temp=`xbacklight -get`
current=${temp%.*}
action="$1"
if [ -z $action ]; then
  exit 0
elif [ $action = "inc" ]; then
  icon="status/display-brightness-symbolic"
  if [ $(($current+5)) -le 100 ]; then
    brightnessStatus=$(($current+5))
    xbacklight -inc 5
  fi
elif [ $action = "dec" ]; then
  icon="status/display-brightness-symbolic"
  if [ $(($current-5)) -ge 0 ]; then
    brightnessStatus=$(($current-5))
    xbacklight -dec 5
  fi
fi
#dunstify -h int:transient:1 -t 1000 -i $icon "Brightness: $brightnessStatus"
notify-send -h int:transient:1 -t 1000 -i $icon "Brightness: $brightnessStatus"
#~/Scripts/notify.sh "Brightness status" "Brightness: $brightnessStatus" "/usr/share/icons/Adwaita/32x32/$icon.symbolic.png" 2 update
