#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Error: Expecting 1 or more arguments"
	echo "Usage: $0 <file 1> <file 2> ..."
	exit 1
fi

mkdir ~/Downlaods -p

echo "yanking items to ~/Downloads/"

url="n00dlephr0g@$($SCRIPTDIR/checknetwork.sh)"

for item in $@
do
	actualitem="$url:$item"
	rsync --info=progress2 -h $actualitem ~/Downloads/
	if [ $? -ne 0 ]; then
		echo "failed yanking $item"
	else
		echo "successfully yanked $item"
	fi
done
