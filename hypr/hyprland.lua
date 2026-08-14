-------------------
---- AUTOSTART ----
-------------------

 hl.on("hyprland.start", function ()
   hl.exec_cmd("waybar")
   hl.exec_cmd("/usr/libexec/hyprpolkitagent")
   hl.exec_cmd("gentoo-pipewire-launcher")
   hl.exec_cmd("~/.cargo/bin/wpaperd")
   hl.exec_cmd("hyprctl setcursor Adwaita 15")
   hl.exec_cmd("linux-wallpaperengine --screen-root DP-2 --bg 3568585209 -f 75  --scaling fill --clamp border")
   hl.exec_cmd("linux-wallpaperengine --screen-root HDMI-A-1 --bg 3568585209 -f 60  --scaling fill --clamp border")
 end)



-- Sourcing other configs
require("input")
require("monitors")
require("lookandfeel")
require("env")
require("windows")
--require("workspaces") -- Workspaces for my main PC
require("bindings")
