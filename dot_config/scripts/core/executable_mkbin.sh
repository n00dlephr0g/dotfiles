#!/bin/bash

# recursively iterate over $SCRIPTDIR
shopt -s globstar
for file in $SCRIPTDIR/**/*.sh; do
	name=basename $file
	echo $name
done
shopt -u globstar
