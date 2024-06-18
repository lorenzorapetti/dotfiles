#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10
## style-11    style-12    style-13    style-14    style-15

dir="$HOME/.config/rofi/launchers/type-2"
theme='style-7'
mode=${1:-drun}

if [ "$mode" == "run" ]; then
    theme='style-1'
elif [ "$mode" == "emoji" ]; then
    theme='style-1'
    rofi -modi "emoji:rofimoji --action=copy" -show emoji -theme ${dir}/${theme}.rasi
    exit 0
fi

## Run
rofi \
    -show $mode \
    -theme ${dir}/${theme}.rasi
