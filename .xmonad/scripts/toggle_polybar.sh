#!/bin/zsh

if pgrep -u $UID -x polybar &> /dev/null 2>&1; then
    killall -q polybar
else
    exec polybar --reload --config=$HOME/.config/polybar/config.ini main
fi
