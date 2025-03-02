#!/bin/bash

bash $HOME/.scripts/installyay.sh

yay -S --needed - < $HOME/.scripts/packages/base.txt
