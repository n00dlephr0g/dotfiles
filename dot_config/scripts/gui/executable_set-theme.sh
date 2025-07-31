#!/bin/bash

if [ $# != 1 ]; then
	echo "usage: $0 <wallpaper path>"
fi

wallpaper=$1

wal --cols16 lighten -n -q -i "$1"
swww img $1

