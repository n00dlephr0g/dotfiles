#!/bin/bash

message="$(date)"

if [ $# -gt 1 ]; then
	message="$@"
fi

git add --all

git commit -m "$message"

git push || echo "sync failedk"
