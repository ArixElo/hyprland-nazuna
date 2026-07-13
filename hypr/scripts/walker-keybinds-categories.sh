#!/usr/bin/env bash

chosen=$(
  cat <<'MENU' | walker --dmenu
[APPS] Super + Enter        → Open Kitty
[APPS] Super + B            → Open your browser
[APPS] Super + G            → Open Steam
[APPS] Super + U            → Open LACT
[APPS] Super + D            → Open Discord
[APPS] Super + A            → Toggle cava visualizer
[APPS] Super + C            → Open VSCode
[APPS] Super + T            → Open Telegram
[APPS] Super + M            → Open your music player
[APPS] Super + F            → Open File Manager 
[APPS] Super + Y            → Open Yazi
[APPS] Super + Space        → App Launcher
[SESSION] Super + Escape    → Power Menu
[SESSION] Super + L         → Quick Lock
[WINDOWS] Super + Q         → Close apps
[WINDOWS] Super + Shift + F → Fullscreen mode
[WINDOWS] Super + Shift + T → Toggle floating/tiling
[WINDOWS] Super + P         → Toggle pseudo windows
[WINDOWS] Super + J         → Toggle split layout
[WINDOWS] Super + Left      → Focus left
[WINDOWS] Super + Right     → Focus right
[WINDOWS] Super + Up        → Focus up
[WINDOWS] Super + Down      → Focus down
[WORKSPACES] Super + 1..0         → Workspaces 1..10
[WORKSPACES] Super + Shift + 1..0 → Move window to workspace 1..10
[WORKSPACES] Super + S            → Toggle special workspace magic
[WORKSPACES] Super + Shift + S    → Move window to special:magic
[WORKSPACES] Super + MouseDown    → Next workspace
[WORKSPACES] Super + MouseUp      → Previous workspace
[SCREENSHOTS] Print                → Screenshot window
[SCREENSHOTS] Super + Print        → Screenshot output
[SCREENSHOTS] Super + Shift + Print → Screenshot region
[MOUSE] Super + Mouse272    → Drag window
[MOUSE] Super + Mouse273    → Resize window
[MEDIA] XF86AudioRaiseVolume → Volume up
[MEDIA] XF86AudioLowerVolume → Volume down
[MEDIA] XF86AudioMute        → Mute audio
[MEDIA] XF86AudioMicMute     → Mute mic
[MEDIA] XF86MonBrightnessUp  → Brightness up
[MEDIA] XF86MonBrightnessDown → Brightness down
[MEDIA] XF86AudioNext        → next track
[MEDIA] XF86AudioPause       → Pause track
[MEDIA] XF86AudioPlay        → Play track
[MEDIA] XF86AudioPrev        → Previous track
[UTILS] Super + R            → Reload waybar
MENU
)

[ -n "$chosen" ] && printf '%s' "$chosen" | wl-copy
