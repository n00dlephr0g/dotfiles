#!/bin/bash

SSID=$(iwgetid -r)

if [ "$SSID" = "TimTen" ]; then
	echo "192.168.0.74"
else
	echo "scallop"
fi
