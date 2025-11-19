#!/bin/bash
if [[ $1 == "laptop" ]]; then
    cp ~/.config/hypr/workspace_mode/lapmode.conf ~/.config/hypr/workspace_mode.conf
elif [[ $1 == "desktop" ]]; then
    cp ~/.config/hypr/workspace_mode/deskmode.conf ~/.config/hypr/workspace_mode.conf
fi

hyprctl reload
