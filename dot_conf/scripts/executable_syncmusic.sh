#!/bin/bash

SSID=$(iwgetid -r)
IPADDR="scallop"
if [ "$SSID" = "TimTen" ] then
	IPADDR="192.168.0.74"
fi
rsync -avh --info=progress2 ~/Music/ "n00dlephr0g@$IPADDR:/data/music"

