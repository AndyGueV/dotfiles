#!/bin/bash

BATTERY="/sys/class/power_supply/BAT0"

last_status=""
low_sent=false
critical_sent=false
full_sent=false

while true; do

    capacity=$(cat "$BATTERY/capacity")
    status=$(cat "$BATTERY/status")

    # =================================
    # CARGADOR CONECTADO / DESCONECTADO
    # =================================

    if [ "$status" != "$last_status" ]; then

        if [ "$status" = "Charging" ]; then
            notify-send \
            "󱐋 Charger Connected" \
            "Battery charging at ${capacity}%"
        fi

        if [ "$status" = "Discharging" ]; then
            notify-send \
            "󰂃 Charger Disconnected" \
            "Running on battery (${capacity}%)"
        fi

        last_status="$status"
    fi

    # =================================
    # BATERÍA BAJA
    # =================================

    if [ "$capacity" -le 25 ] && \
       [ "$capacity" -gt 15 ] && \
       [ "$status" = "Discharging" ] && \
       [ "$low_sent" = false ]; then

        notify-send \
        "󰁺 Low Battery" \
        "Battery at ${capacity}%"

        low_sent=true
    fi

    # =================================
    # BATERÍA CRÍTICA
    # =================================

    if [ "$capacity" -le 15 ] && \
       [ "$status" = "Discharging" ] && \
       [ "$critical_sent" = false ]; then

        notify-send \
        "󰂎 Critical Battery" \
        "Battery at ${capacity}%"

        critical_sent=true
    fi

    # =================================
    # CARGA COMPLETA
    # =================================

    if [ "$capacity" -ge 95 ] && \
       [ "$status" = "Charging" ] && \
       [ "$full_sent" = false ]; then

        notify-send \
        "󰂄 Battery Full" \
        "Battery charged (${capacity}%)"

        full_sent=true
    fi

    # =================================
    # RESET FLAGS
    # =================================

    if [ "$capacity" -gt 25 ]; then
        low_sent=false
    fi

    if [ "$capacity" -gt 15 ]; then
        critical_sent=false
    fi

    if [ "$capacity" -lt 95 ]; then
        full_sent=false
    fi

    sleep 10
done
