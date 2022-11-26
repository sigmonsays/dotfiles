#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit


for m in $(polybar --list-monitors | cut -d":" -f1); do
    logfile=/dev/null
    MONITOR=$m polybar --reload bar1 >$logfile 2>&1 &
done
