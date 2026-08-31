#!/bin/bash
if [[ $1 == "laptop" ]]; then
    cp ~/.config/hypr/workspace_mode/lapmode.lua ~/.config/hypr/workspace_mode.lua
elif [[ $1 == "desktop" ]]; then
    cp ~/.config/hypr/workspace_mode/deskmode.lua ~/.config/hypr/workspace_mode.lua
fi

hyprctl reload