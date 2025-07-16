#!/bin/bash

if [ $# != 1 ]; then
	echo "usage: $0 <wallpaper path>"
fi

wallpaper=$1

wal -i $1
swww img $1

