#!/bin/bash
# With icon indicating the state of the mic

state=`pacmd list-sinks | awk '/muted/ { print $2 }' | tail -1`
micStatus="no"
if [ $state = "yes" ]; then
    micStatus="on"
    icon="status/audio-volume-high-symbolic"
else
    micStatus="off"
    icon="status/audio-volume-muted-symbolic"
fi
pactl set-sink-mute 0 toggle
notify-send --hint=int:transient:1 -t 1000 -i $icon "Speaker switched: $state"
#dunstify -h int:transient:1 -t 1000 -i $icon "Speaker switched: $state"
#~/Scripts/notify.sh "Speaker status" "Speaker switched: $micStatus" "/usr/share/icons/Adwaita/32x32/$icon.symbolic.png" 2 update
