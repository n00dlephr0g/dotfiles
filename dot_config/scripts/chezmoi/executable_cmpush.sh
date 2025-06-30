#!/bin/sh

chmod +x $SCRIPTDIR/*

cd ~/.local/share/chezmoi

chezmoi re-add

chezmoi add -r "$SCRIPTDIR/"
chezmoi add -r "$PACKAGEDIR/"
chezmoi add -r "$BINDIR/"
chezmoi add -r "~/.config/nvim/lua/"
chezmoi add -r "~/.config/nvim/colors"

git add .

git commit -m "$(date "+%D %T")"

git push


