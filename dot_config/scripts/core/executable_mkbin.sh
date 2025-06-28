#!/bin/bash

# recursively iterate over $SCRIPTDIR
shopt -s globstar
for file in $SCRIPTDIR/**/*.sh; do
	basename=$(basename $file .sh)
	chmod +x $file
	ln -sf $file "$BINDIR/$basename"
done
shopt -u globstar
