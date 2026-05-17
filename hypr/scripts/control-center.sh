#!/usr/bin/env bash

chosen=$(printf "󰕾  Volumen +\n󰖀  Volumen -\n󰃠  Brillo +\n󰃞  Brillo -\n󰌵  Modo lectura\n󰹑  Captura pantalla\n󰍹  Captura región" | rofi -dmenu -i -p "Control Center")

case "$chosen" in
    "󰕾  Volumen +")
        pamixer -i 5
        ;;

    "󰖀  Volumen -")
        pamixer -d 5
        ;;

    "󰃠  Brillo +")
        brightnessctl set +10%
        ;;

    "󰃞  Brillo -")
        brightnessctl set 10%-
        ;;

    "󰌵  Modo lectura")
        pkill gammastep || gammastep -O 3500
        ;;

    "󰹑  Captura pantalla")
        hyprshot -m output
        ;;

    "󰍹  Captura región")
        hyprshot -m region
        ;;
esac
