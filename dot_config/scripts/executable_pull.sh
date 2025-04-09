#!/bin/bash

if git pull; then
	exit 0
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
