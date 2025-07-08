#!/bin/bash

SSID=$(iwgetid -r)

IPADDR="scallop"

if [ "$#" -ne 2 ]; then
	echo "Error: expecting 2 arguments"
	echo "Usage: $0 <source1> <source2> ... <destination>"
	exit 1
fi

if [ "$SSID" = "TimTen" ]; then
	echo "home network detected, syncing on local"
	IPADDR="192.168.0.74"
else
	echo "no home network detected, syncing to remote"
fi


rsync -avh --info=progress2 $1 "n00dlephr0g@$IPADDR:$2"

