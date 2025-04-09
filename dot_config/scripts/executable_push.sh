#!/bin/bash

message="$(date)"
if [ $# -mt 1]; then
	echo "commit message:\n$1"
	message=$1
fi

git add --all
git commit -m "commit message"

git push || echo "sync failed"
