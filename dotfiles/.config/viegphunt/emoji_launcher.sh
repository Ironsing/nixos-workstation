#!/usr/bin/env zsh

if pidof rofi > /dev/null; then
    pkill rofi
fi

rofimoji --clipboarder wl-copy