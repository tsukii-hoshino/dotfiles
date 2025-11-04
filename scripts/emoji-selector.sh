#!/bin/bash

chosen=$(cat ~/.config/emoji.txt | rofi -dmenu -i -p "Emoji")

emoji=$(echo "$chosen" | awk '{print $1}')

if [ -n "$emoji" ]; then
   #echo -n "$emoji" | xclip -selection clipboard  # for x11
  echo -n "$emoji" | wl-copy  # for wayland
fi
