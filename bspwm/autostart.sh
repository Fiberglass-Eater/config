#!/bin/sh

#Set my background
feh --bg-scale --no-fehbg $HOME/usr/Images/japanese_white_washed_red_bridge.jpg
#Start polybar and kill previous instances
killall -q polybar
polybar top -r

# Source my X colors
xrdb $HOME/sys/config/Xresources

