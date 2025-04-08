#!/bin/bash
SSID=$(iwgetid -r)
ipaddr= 
if [ "$SSID" = "TimTen" ] then
	rsync -avh --delete --info=progress2 ~/Music/ n00dlephr0g@:/data/navidrome
