#!/bin/bash

SSID=$(iwgetid -r)


if [ "$#" -ne 2 ]; then
	echo "Error: expecting 2 arguments"
	echo "Usage: $0 <source1> <source2> ... <destination>"
	exit 1
fi

IPADDR=$(checknetwork)

rsync -avh --info=progress2 $1 "n00dlephr0g@$IPADDR:$2"

