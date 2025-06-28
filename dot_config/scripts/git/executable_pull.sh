#!/bin/bash

code=$(git pull)

if [ $code -eq 0 ]; then
	exit 0
elif [ $code -eq 128 ]; then
	exit 1
fi

echo "reset to origin/main? [y/N]: "
read res
if [ ${res,,} = "y" ]; then
	echo "resetting to origin/main"
	git reset origin/main || exit 1
else
	echo "do nothing, exiting."
fi

exit 0
