#!/bin/sh

cd ~/.local/share/chezmoi

chezmoi re-add

chezmoi add -r "$SCRIPTDIR/"
chezmoi add -r "$PACKAGEDIR/"
chezmoi add -r "$BINDIR/"
chezmoi add -r "~/.config/nvim/lua/"
chezmoi add -r "~/.config/nvim/colors"
chezmoi add -r "~/.config/wal/templates"

git add .

git commit -m "$(date "+%D %T")"

git push


