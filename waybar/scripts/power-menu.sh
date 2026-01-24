#!/bin/bash

# Nazuna Power Menu - Rofi theme
ROFI_CMD="rofi -theme ~/.config/rofi/nazuna.rasi -dmenu -p 'Nazuna 🔴 Power' -lines 4 -eh 1 -width 25 -location 0"

choice=$(echo -e "🔒 Lock\n💤 Suspend\n🔄 Reboot\n⏻ Shutdown" | $ROFI_CMD)

case "$choice" in
    *Lock*) hyprlock ;;  # lub swaylock/swayidle
    *Suspend*) systemctl suspend ;;
    *Reboot*) systemctl reboot ;;
    *Shutdown*) systemctl poweroff ;;
esac
