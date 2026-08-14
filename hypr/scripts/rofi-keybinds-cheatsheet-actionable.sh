#!/usr/bin/env bash

declare -A actions=(
  ["Super + Enter        -> Open Kitty"]="kitty"
  ["Super + B            -> Open your browser"]="vivaldi"
  ["Super + G            -> Open Steam"]="steam"
  ["Super + U            -> Open LACT"]="lact"
  ["Super + D            -> Open Discord"]="discord"
  ["Super + A            -> Toggle cava visualizer"]="~/.config/hypr/scripts/toggle-cava.sh"
  ["Super + C            -> Open VSCode"]="code"
  ["Super + T            -> Open Telegram"]="telegram-desktop"
  ["Super + M            -> Open your music player"]="mpv"
  ["Super + F            -> Open File Manager"]="thunar"
  ["Super + Y            -> Open Yazi"]="hyprctl dispatch 'hl.dsp.exec_cmd("kitty yazi", { float = true }))'"
  ["Super + Space        -> App Launcher"]="rofi -show drun -theme "~/.config/rofi/nazuna.rasi""
  ["Super + Escape    -> Power Menu"]="wlogout"
  ["Super + L         -> Quick Lock"]="hyprlock"
  ["Super + R             -> Reload waybar"]="pkill waybar; waybar &"
)

menu=""
for key in "${!actions[@]}"; do
  menu+="$key"$'\n'
done

chosen=$(printf '%s' "$menu" | sort | rofi -dmenu -theme "~/.config/rofi/nazuna.rasi" -i -p "Keybinds" -theme-str 'window {width: 40%;} listview {lines: 15;}')

[ -z "$chosen" ] && exit 0

cmd="${actions[$chosen]}"
if [ -n "$cmd" ]; then
  setsid -f bash -c "$cmd" >/dev/null 2>&1
else
  printf '%s' "$chosen" | wl-copy
fi
