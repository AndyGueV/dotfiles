#!/bin/bash

chosen=$(printf "  Apagar\n󰜉  Reiniciar\n󰍃  Cerrar sesión\n󰤄  Suspender\n󰌾  Bloquear" | wofi --dmenu)

case "$chosen" in
    *"Apagar") systemctl poweroff ;;
    *"Reiniciar") systemctl reboot ;;
    *"Cerrar sesión") hyprctl dispatch exit ;;
    *"Suspender") systemctl suspend ;;
    *"Bloquear") hyprlock ;;
esac
