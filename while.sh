#!/bin/bash

#Gets the current workspace #
curWS=$(xdotool get_desktop)

# Holds the # of how many window there are on the curWS
lines=$(wmctrl -lG | awk '{ if ($2 == '"$curWS"') print $0; }' | wc -l)
echo "window = $lines"

# If there is only one window open, do the obvious
if [[ $lines == 1 ]]
then
	i3-msg 'split horizontal'
	i3-msg 'exec termite'
fi

# c == counter
c=1
# Array to hold HEXES
ArrayN=()
# Push the HEXES of the windows in ArrayN
while [[ $c -le $lines ]]
do
	arrayN+=($(wmctrl -lG | awk '{ if ($2 == '"$curWS"') print $0; }' | awk '{print $1}' | awk 'FNR == '"$c"' {print}'))
	c=$((c+1))
done
echo "${arrayN[@]}"

# Holds Width
arrayW=()
# Holds Height
arrayH=()
c=1
# While loop pushes all W&H of windows into their respective array
while [[ $c -le $lines ]]
do
	arrayW+=($(wmctrl -lG | awk '{ if ($2 == '"$curWS"') print $0; }' | awk '{print $5}' | awk 'FNR == '"$c"' {print}'))
	arrayH+=($(wmctrl -lG | awk '{ if ($2 == '"$curWS"') print $0; }' | awk '{print $6}' | awk 'FNR == '"$c"' {print}'))
	c=$((c+1))
done
echo ${arrayW[@]}
echo ${arrayH[@]}

# Find the largest w & h
biggestW=${arrayW[1]}
biggestH=${arrayH[1]}
# Checks if there is a biggest Width
changeW=false
# If so, save the index
save_cW=0
while [[ $c -gt 0 ]]
do
	if [[ $biggestW -lt ${arrayW[c-1]} ]]
	then
		biggestW=${arrayW[c-1]}
		changeW=true
	fi

	if $changeW
	then
		save_cW=$c
	fi
	c=$((c-1))
done

c=$lines
# Check if there is a biggest Height
changeH=false
# If so, save Index
save_cH=0
while [[ $c -gt 0 ]]
do
	if [[ $biggestH -lt ${arrayH[c-1]} ]]
	then
		biggestH=${arrayH[c-1]}
		changeH=true
	fi

	if $changeH
	then
		save_cH=$c
	fi
	c=$((c-1))
done

# If both changes are false, go to last window and slip that one

echo $biggestW
echo $biggestH
echo $changeW
echo $changeH

if $changeH
then
	wmctrl -i -a "${arrayN[save_cH-1]}"
else
	echo "bro"
fi
