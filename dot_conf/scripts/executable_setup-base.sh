#!/bin/bash

bash $HOME/.scripts/setup-yay.sh

yay -S --needed - < $HOME/.packages/base.txt
