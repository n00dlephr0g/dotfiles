#!/bin/bash

SSID=$(iwgetid -r)
IPADDR="scallop"
if [ "$SSID" = "TimTen" ]; then
	echo "home network detected, syncing on local"
	IPADDR="192.168.0.74"
else
	echo "no home network detected, syncing to remote"
fi


rsync -avh --info=progress2 ~/Music/ "n00dlephr0g@$IPADDR:/data/music"

