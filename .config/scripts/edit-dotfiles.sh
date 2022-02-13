#!/bin/bash
# edit-dotfiles.sh
# alex-laycalvert
#
# https://github.com/alex-laycalvert/dotfiles
#
# A simple dmenu script for quickly opening my dotfiles
# in a text editor.

DOTFILES="autostart
fish
flameshot
gpicview
kitty
lazygit
libreoffice
nautilus
nvim
picom
pulse
qtile
ranger
scripts
vlc
volumeicon
yay
"

DMENU_PROMPT=" edit > "
DMENU_HEIGHT="50"
DMENU_FONT="Sauce Code Pro Nerd Font"
DMENU_NBCOLOR="#202030"
DMENU_NFCOLOR="#1793d1"
DMENU_SBCOLOR="#303045"
DMENU_SFCOLOR="#1793d1"

RESPONSE=$(echo -e "$DOTFILES" | 
           dmenu -h "$DMENU_HEIGHT" -p "$DMENU_PROMPT" -fn "$DMENU_FONT" -nb "$DMENU_NBCOLOR" -nf "$DMENU_NFCOLOR" -sb "$DMENU_SBCOLOR" -sf "$DMENU_SFCOLOR")

if [ ! "$RESPONSE" = "" ]; then
    cd "$HOME/.config/$RESPONSE"
    kitty nvim .
fi
