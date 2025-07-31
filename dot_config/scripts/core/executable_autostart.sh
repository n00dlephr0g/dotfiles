#!/bin/bash

swww-daemon &
swww restore
pipewire-pulse &
tailscale up &
systemctl --user start hyprpolkitagent
iwctl station wlan0 scan

