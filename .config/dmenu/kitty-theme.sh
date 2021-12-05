#!/bin/bash
# change-kitty-theme.sh

KITTY_THEME=`/usr/bin/ls $HOME/.config/kitty/themes/ | dmenu -p "Kitty Theme: "`
sed "s/include themes\/.*[.]conf/include themes\/$KITTY_THEME/" $HOME/.config/kitty/kitty.conf > kitty.conf.new
mv kitty.conf.new $HOME/.config/kitty/kitty.conf
kill -USR1 $KITTY_PID
