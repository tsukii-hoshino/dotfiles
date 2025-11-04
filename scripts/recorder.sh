#!/bin/bash

RECORDING_PATH="$HOME/Videos/recording_$(date +%F_%H-%M-%S).mp4"

if pgrep -x wf-recorder > /dev/null; then
    pkill -INT wf-recorder
    notify-send "screen recording stopped"
else
    wf-recorder -f "$RECORDING_PATH" &
    notify-send "screen recording started"
fi
