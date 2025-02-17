#!/bin/sh

cd ~/.local/share/chezmoi

git add .

git commit -m "$(date "+%D %T")"

git push


