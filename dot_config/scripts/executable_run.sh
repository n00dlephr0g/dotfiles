#!/bin/bash

if [ $# -le 1 ]; then
	echo "Usage: $0 <script name>"
	exit 1
fi

for script in $*
do
	echo $(basename $script)
done
