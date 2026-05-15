-- Apps
hl.bind("SUPER + Return",   hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + B",        hl.dsp.exec_cmd(browser))
hl.bind("SUPER + D",        hl.dsp.exec_cmd(discord))
hl.bind("SUPER + A",        hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-cava.sh"))
hl.bind("SUPER + C",        hl.dsp.exec_cmd("code"))
hl.bind("SUPER + Q",        hl.dsp.window.close())
hl.bind("SUPER + T",        hl.dsp.exec_cmd(telegram))
hl.bind("SUPER + M",        hl.dsp.exec_cmd("pear-desktop"))
hl.bind("SUPER + F",        hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + Y",        hl.dsp.exec_cmd("kitty yazi", { float = true }))
hl.bind("SUPER + SPACE",    hl.dsp.exec_cmd(menu))
hl.bind("SUPER + ESCAPE",   hl.dsp.exec_cmd("wlogout"))
hl.bind("SUPER + L",        hl.dsp.exec_cmd("hyprlock"))

-- Window management
hl.bind("SUPER SHIFT + F",  hl.dsp.window.fullscreen())
hl.bind("SUPER SHIFT + T",  hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P",        hl.dsp.window.pseudo())
hl.bind("SUPER + J",        hl.dsp.layout("togglesplit"))

-- Focus
hl.bind("SUPER + left",     hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right",    hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",       hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",     hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind("SUPER + S",        hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Screenshots
hl.bind("Print",             hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SUPER + Print",     hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SUPER SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move/resize z myszą
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume & brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })