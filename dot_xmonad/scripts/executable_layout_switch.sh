#!/bin/zsh
# switch between keyboard layouts
#
if [[ -n "$1" ]]; then
    setxkbmap $1
else
    layout=$(setxkbmap -query | awk 'END{print $2}')
    case $layout in
        gb)
            setxkbmap dk
            ;;
        dk)
            setxkbmap gb
            ;;
        *)
            setxkbmap gb
            ;;
    esac
fi
