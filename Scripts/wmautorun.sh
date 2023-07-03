#!/bin/bash

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# general
feh --bg-center ~/Pictures/Wallpapers/obsess.jpg
xset -b b off
#redshift -x
#redshift -O 3000
xbacklight -set 20
#run picom
run nm-applet
#run onboard
#run fcitx5

# startup applications
#feh -. -g 400x500 ~/Desktop/improve.jpg

# xmonad
# run trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x5f5f5f --height 20

# bspwm
#run polybar bar
