#!/bin/bash

bash $HOME/.scripts/installyay.sh

yay -S --needed - < $HOME/.packages/base.txt
