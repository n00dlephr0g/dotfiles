#!/bin/sh

chmod +x $SCRIPTDIR/*.sh

cd ~/.local/share/chezmoi

chezmoi re-add

git add .

git commit -m "$(date "+%D %T")"

git push


