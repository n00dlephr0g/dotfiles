#!/bin/bash

usage="Usage: $0 <increase,inc or decrease,dec or togglemute,tog> <amount (not required for togglemute)>"

# usage: volume <increase/decrease/togglemute> <amount>
if [ $# = 0 ]; then
	echo $usage
	exit 1
fi
if [ $1 = "togglemute" ] || [ $1 = "tm" ]; then
	pulsemixer --toggle-mute
	exit 0
fi


if [ $# != 2 ]; then
	echo "Error: Expecting 2 arguments"
	echo $usage
	exit 1
fi

command="pulsemixer --change-volume "

if [ $1 = "increase" ] || [ $1 = "inc" ]; then
	$command+$2 || exit 1
elif [ $1 = "decrease" ] || [ $1 = "dec" ]; then
	$command-$2 || exit 1
else
	echo $usage
	exit 1
fi

exit 0
