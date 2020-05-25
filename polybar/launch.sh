#!/bin/sh

# Terminate already running bar instances
killall -q polybar

#Launch
polybar top -r 
