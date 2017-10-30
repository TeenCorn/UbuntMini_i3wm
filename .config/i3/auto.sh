#!/bin/bash

while true
do
#curWS == Current workspace number
curWS=$(xdotool get_desktop)

#winOP == Amount of window open in current workspace
winOP=$(wmctrl -l | awk '{if ($2 == '"$curWS"') print $0;}' | wc -l)


#Hex of Root window
god=$(wmctrl -l | awk '{if ($2 == '"$curWS"') print $0; }' | awk 'FNR == 1 {print}' | awk '{print $1}')

#Hex of most recently opened window
last_win=$(wmctrl -l | awk '{if ($2 == '"$curWS"') print $0; }' | awk 'FNR == '"$winOP"' {print}' | awk '{print $1}')

dim_x=$(wmctrl -lG | awk '{ if ($2 == '"curWS"') print $0; }' | awk '{print $5}')
dim_h=$(wmctrl -lG | awk '{ if ($2 == '"curWS"') print $0; }' | awk '{print $6}')


if [ $winOP == 5 ]
then 
	winOP=$((winOP-2))
	echo "$winOP"
	last_win=$(wmctrl -l | awk '{if ($2 == '"$curWS"') print $0; }' | awk 'FNR == '"$winOP"' {print}' | awk '{print $1}')
	wmctrl -i -a "$last_win"
elif [ $winOP == 4 ]
then
	wmctrl -i -a "$last_win"
elif [ $winOP == 3 ]
then
	echo "$god"
	wmctrl -i -a "$god"
	i3-msg 'split vertical'

elif [ $((winOP % 2)) == 0 ]
then
	wmctrl -i -a "$last_win"
	i3-msg 'split vertical'
else
	wmctrl -i -a "$last_win"
	i3-msg 'split horizontal'
fi

sleep 1
done
#Rather than doing it based on the amount of windows, base it on GEOMETRY

##Psuedo code
#Find -> bigWin
#If (windows are the same size)
#then
#focus last_win; exec ~
#else
#focus big_win
#split accordingly
