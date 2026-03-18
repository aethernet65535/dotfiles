#!/bin/bash

# file: user-install.sh
# author: Liew Rui Yan
# last-updated: 2026-03-17

set -e

# Update
# ======
update_pacman()
{
    sudo pacman -Syu
}

# Paru
# ====
install_aur()
{
    echo "Installing Paru..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si
    echo "OK: Paru"
}

# Linux
# =====
install_linux()
{
    LINUX_TOOLS=(
        "bc" 
        "gcc" 
        "git" 
        "flex"
        "clang" 
        "ctags" 
        "ripgrep" 
        "virtme-ng"
        "python-sphinx"
    )
    echo "Installing dev tools..."
    sudo pacman -S "${LINUX_TOOLS[@]}"
    echo "OK: dev tools"
}

# Neovims
# =======
install_nvims()
{
    NEOVIM_TOOLS=(
        "nvim"
        "lua"
        "lua51"
        "stylua"
        "luarocks"
    )
    echo "Installing Neovims..."
    sudo pacman -S "${NEOVIM_TOOLS[@]}"
    echo "OK: Neovims"
}

# Hyprland
# ========
install_desktop()
{
    HYPR_TOOLS=(
        "yazi"
        "wofi"
        "grim"
        "kitty"
        "waybar"
        "swaync"
        "firefox"
        "dolphin"
        "hyprland"
        "cliphist"
        "syncthing"
        "hyprpaper"
        "xorg-xhost"
        "wl-clipboard"
        "brightnessctl"
        "hyprpolkitagent"
    )
    echo "Installing Hyprland..."
    sudo pacman -S "${NEOVIM_TOOLS[@]}"
    echo "OK: Hyprland"
}

install_all_packages()
{
    install_linux
    install_nvims
    install_desktop
}

install_all_packages
