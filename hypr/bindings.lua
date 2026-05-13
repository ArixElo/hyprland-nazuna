-- Apps
hl.bind("SUPER", "Return",  "exec", terminal)
hl.bind("SUPER", "B",       "exec", browser)
hl.bind("SUPER", "D",       "exec", discord)
hl.bind("SUPER", "A",       "exec", "~/.config/hypr/scripts/toggle-cava.sh")
hl.bind("SUPER", "C",       "exec", "code")
hl.bind("SUPER", "Q",       "killactive")
hl.bind("SUPER", "T",       "exec", telegram)
hl.bind("SUPER", "M",       "exec", "pear-desktop")
hl.bind("SUPER", "F",       "exec", fileManager)
hl.bind("SUPER", "Y", hl.dsp.exec_cmd("kitty yazi", { float = true }))
hl.bind("SUPER", "SPACE",   "exec", menu)
hl.bind("SUPER", "ESCAPE",  "exec", "wlogout")
hl.bind("SUPER", "L",       "exec", "hyprlock")

-- Window management
hl.bind("SUPER SHIFT", "F", "fullscreen")
hl.bind("SUPER SHIFT", "T", "togglefloating")
hl.bind("SUPER", "P",       "pseudo")
hl.bind("SUPER", "J",       "togglesplit")

-- Focus
hl.bind("SUPER", "left",  "movefocus", "l")
hl.bind("SUPER", "right", "movefocus", "r")
hl.bind("SUPER", "up",    "movefocus", "u")
hl.bind("SUPER", "down",  "movefocus", "d")

-- Workspaces
for i = 1, 9 do
    hl.bind("SUPER",       tostring(i), "workspace",       tostring(i))
    hl.bind("SUPER SHIFT", tostring(i), "movetoworkspace", tostring(i))
end
hl.bind("SUPER",       "0", "workspace",       "10")
hl.bind("SUPER SHIFT", "0", "movetoworkspace", "10")

-- Scratchpad
hl.bind("SUPER",       "S", "togglespecialworkspace", "magic")
hl.bind("SUPER SHIFT", "S", "movetoworkspace",        "special:magic")

-- Scroll workspaces
hl.bind("SUPER", "mouse_down", "workspace", "e+1")
hl.bind("SUPER", "mouse_up",   "workspace", "e-1")

-- Screenshots
hl.bind("",            "Print", "exec", "hyprshot -m window")
hl.bind("SUPER",       "Print", "exec", "hyprshot -m output")
hl.bind("SUPER SHIFT", "Print", "exec", "hyprshot -m region")

-- Move/resize with mouse
hl.bindm("SUPER", "mouse:272", "movewindow")
hl.bindm("SUPER", "mouse:273", "resizewindow")

-- Volume & brightness
hl.binde("", "XF86AudioRaiseVolume",  "exec", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
hl.binde("", "XF86AudioLowerVolume",  "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
hl.binde("", "XF86AudioMute",         "exec", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
hl.binde("", "XF86AudioMicMute",      "exec", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
hl.binde("", "XF86MonBrightnessUp",   "exec", "brightnessctl -e4 -n2 set 5%+")
hl.binde("", "XF86MonBrightnessDown", "exec", "brightnessctl -e4 -n2 set 5%-")

-- Media keys
hl.bindl("", "XF86AudioNext",  "exec", "playerctl next")
hl.bindl("", "XF86AudioPause", "exec", "playerctl play-pause")
hl.bindl("", "XF86AudioPlay",  "exec", "playerctl play-pause")
hl.bindl("", "XF86AudioPrev",  "exec", "playerctl previous")