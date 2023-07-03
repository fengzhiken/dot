#!/bin/bash

server_type=$1

if [ "$server_type" = "wayland" ];
then
  type=$2
	imgName="/home/$(whoami)/Pictures/Screenshot_$(date +'%Y%m%d_%H%M%S').png"
  /usr/share/sway/scripts/grimshot save $type $imgName
  wl-copy < $imgName
else
	imgName="/home/$(whoami)/Pictures/Screenshot_$(date +'%Y%m%d_%H%M%S').png"
  import -silent $imgName
  xclip -selection clipboard -t image/png -i $imgName
fi
