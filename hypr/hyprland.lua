
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "walker"
local browser = "vivaldi"
local discord = "discord"
local telegram = "Telegram"

-------------------
---- AUTOSTART ----
-------------------

 hl.on("hyprland.start", function () 
   hl.exec_cmd("systemctl --user restart elephant")
   hl.exec_cmd("walker --gapplication-service")
   hl.exec_cmd("waybar")
   hl.exec_cmd("wpaperd")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"")
 end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME","qt6ct")

-- Sourcing other configs
require("input")
require("monitors")
require("lookandfeel")
require("env")
require("windows")
-- require("workspaces") -- Workspaces for my main PC
require("bindings")