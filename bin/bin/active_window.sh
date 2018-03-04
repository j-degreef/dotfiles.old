#!/bin/sh

title=$(xprop -root _NET_ACTIVE_WINDOW | cut -d '#' -f 2| tr -d ' ')
title=$(xprop -id ${title} | awk '/WM_NAME/{$1=$2="";print}' | awk NR==1 | cut -d '"' -f2)
echo $title

