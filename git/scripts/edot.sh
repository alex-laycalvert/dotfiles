#!/bin/bash

DOTFILES="$HOME/git/scripts/dotfiles.txt"
INPUT=`cat $DOTFILES | dmenu`

case $INPUT in
    qtile)
        nvim "$HOME/.config/qtile/config.py"
        ;;
    kitty)
        nvim "$HOME/.config/kitty/kitty.conf"
        ;;
    picom)
        nvim "$HOME/.config/picom/picom.conf"
        ;;
    starship)
        nvim "$HOME/.config/starship.toml"
        ;;
    neovim)
        nvim "$HOME/.config/nvim/init.lua"
        ;;
    dmenu)
        nvim "$HOME/.config/dmenu"
        ;;
    zshrc)
        nvim "$HOME/.zshrc"
        ;;
    zsh_plugins)
        nvim "$HOME/.zsh_plugins_list"
        ;;
    *)
        echo "No such dotfile"
        ;;
esac
