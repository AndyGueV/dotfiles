#!/bin/bash

while true; do
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$battery" -le 25 ] && [ "$status" = "Discharging" ]; then
        notify-send "󰁺 Battery Low" "Battery at ${battery}%"
        sleep 300
    fi

    if [ "$battery" -ge 95 ] && [ "$status" = "Charging" ]; then
        notify-send "󰂄 Battery Full" "Disconnect charger"
        sleep 300
    fi

    sleep 60
done
