
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
 end)



-- Sourcing other configs
require("input")
require("monitors")
require("lookandfeel")
require("env")
require("windows")
-- require("workspaces") -- Workspaces for my main PC
require("bindings")