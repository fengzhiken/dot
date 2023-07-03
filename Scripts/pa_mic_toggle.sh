#!/bin/bash
# With icon indicating the state of the mic

state=`pacmd list-sources | awk '/muted/ { print $2 }' | tail -1`
micStatus="no"
if [ $state = "yes" ]; then
    micStatus="on"
    icon="devices/audio-input-microphone-symbolic"
else
    micStatus="off"
    icon="status/microphone-disabled-symbolic"
fi
pactl set-source-mute 1 toggle
notify-send --hint=int:transient:1 -t 1000 -i $icon "Mic switched: $state"
#dunstify -h int:transient:1 -t 1000 -i $icon "Mic switched: $state"
#~/Scripts/notify.sh "Mic status" "Mic switched: $micStatus" "/usr/share/icons/Adwaita/32x32/$icon.symbolic.png" 2 update
