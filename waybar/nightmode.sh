#!/usr/bin/env bash

if pgrep gammastep > /dev/null; then
    pkill gammastep
else
    gammastep -O 3500 &
fi
