#!/bin/sh

cat $CONFDIR/.gitignore > ~/.local/share/chezmoi/.chezmoiignore

cd ~/.local/share/chezmoi

chezmoi re-add

chezmoi add $CONFDIR -r

git add .

git commit -m "$(date "+%D %T")"

git push


