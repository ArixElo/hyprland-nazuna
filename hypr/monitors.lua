--hl.monitor({
   -- output   = "",
   -- mode     = "preferred",
   -- position = "auto",
   -- scale    = "1.2",
--})

hl.monitor({
   output  =  "DP-2",
   mode    = "1680x1050@75",
   position = "0x0",
   scale =    "1"
}) -- My main monitor

hl.monitor({
   output  =  "HDMI-A-1",
   mode    = "1280x1024@75.025",
   position = "1680x0",
   scale =    "1"
}) -- My second monitor
