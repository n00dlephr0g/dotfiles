#!/bin/bash

bash $HOME/.conf/scripts/setup-yay.sh

yay -S --needed - < $HOME//base.txt
