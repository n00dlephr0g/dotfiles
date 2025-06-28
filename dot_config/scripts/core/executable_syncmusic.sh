#!/bin/bash

SSID=$(iwgetid -r)

rsync -avh --size-only --ignore-existing --info=progress2 ~/Music/ "n00dlephr0g@$(checknetwork):/data/music"

