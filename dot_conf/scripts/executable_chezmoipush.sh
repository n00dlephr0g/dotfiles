#!/bin/sh


cd ~/.local/share/chezmoi

chezmoi re-add

chezmoi add $SCRIPTDIR/*
chezmoi add $PACKAGEDIR/*

git add .

git commit -m "$(date "+%D %T")"

git push


