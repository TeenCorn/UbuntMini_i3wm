#!/bin/bash

#Sets global variable
#Copys string from field 4 from the list of processes currently running
ranger=$(ps -e | awk '/ranger/{print $4}')

if [ "$ranger" = "ranger" ]
then
	killall compton

	#Infinite loop until...
	while true
	do
		#Updates ranger variable
		ranger=$(ps -e | awk '/ranger/{print $4}')
		
		#Once ranger is no longer running "break" out of the while loop
		if [ "$ranger" = "" ]
		then
			break
		fi
	done

	#Restart compton
	compton -f -i 0.5 --active-opacity 1.0 -b
fi
