#!/bin/bash

proc=$(ps -A | grep mpv | awk '{ print $4 }')
work=$(awk '/ws8/ {print $3, "!"$4}' /$HOME/.config/i3/config | awk 'FNR == 1 {print}')

if [ $proc == "mpv" ]
then
	i3-msg workspace $work 
fi
