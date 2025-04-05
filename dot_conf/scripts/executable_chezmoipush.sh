#!/bin/sh


cd ~/.local/share/chezmoi

chezmoi re-add

chezmoi add -r $SCRIPTDIR
chezmoi add -r $PACKAGEDIR

git add .

git commit -m "$(date "+%D %T")"

git push


