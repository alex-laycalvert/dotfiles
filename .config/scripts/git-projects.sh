#!/bin/bash
# git-projects.sh
# alex-laycalvert
#
# https://github.com/alex-laycalvert/dotfiles
#
# A simple dmenu script for quickly opening my current
# git projects in a text editor.

DMENU_PROMPT=" git > "
DMENU_HEIGHT="50"
DMENU_FONT="Sauce Code Pro Nerd Font"
DMENU_NBCOLOR="#202030"
DMENU_NFCOLOR="#1793d1"
DMENU_SBCOLOR="#303045"
DMENU_SFCOLOR="#1793d1"

GIT_PROJECTS_DIR="$HOME/git"

LS_CMD="/usr/bin/ls"
GIT_PROJECTS=$($LS_CMD "$GIT_PROJECTS_DIR")

RESPONSE=$(echo -e "$GIT_PROJECTS" | 
           dmenu -h "$DMENU_HEIGHT" -p "$DMENU_PROMPT" -fn "$DMENU_FONT" -nb "$DMENU_NBCOLOR" -nf "$DMENU_NFCOLOR" -sb "$DMENU_SBCOLOR" -sf "$DMENU_SFCOLOR")

if [ ! "$RESPONSE" = "" ]; then
    cd "$GIT_PROJECTS_DIR/$RESPONSE"
    nvim .
fi
