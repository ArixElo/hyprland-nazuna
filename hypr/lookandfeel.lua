-- General
hl.config("general:gaps_in",    5)
hl.config("general:gaps_out",   10)
hl.config("general:border_size", 1)

-- Nazuna's colors - deep purple borders with pink accent
hl.config("general:col.active_border",   "rgba(b968c7ff) rgba(7b68eeff) 45deg")
hl.config("general:col.inactive_border", "rgba(2d2a4eff)")

hl.config("general:layout",        "dwindle")
hl.config("general:allow_tearing", true)

-- Decoration
hl.config("decoration:rounding", 8)

-- Blur
hl.config("decoration:blur:enabled",          true)
hl.config("decoration:blur:size",             3)
hl.config("decoration:blur:passes",           1)
hl.config("decoration:blur:new_optimizations", true)
hl.config("decoration:blur:noise",            0.05)
hl.config("decoration:blur:contrast",         1.1)
hl.config("decoration:blur:brightness",       1.0)

-- Enable animations
hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier curves
hl.curve("easeOutQuint",    { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic",  { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",          { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear",    { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick",           { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

-- Animations
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   curve = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, curve = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, curve = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  curve = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, curve = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, curve = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, curve = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, curve = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, curve = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    curve = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  curve = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, curve = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, curve = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = false })

-- Layout: Dwindle
hl.config("dwindle:pseudotile",     true)
hl.config("dwindle:preserve_split", true)
hl.config("dwindle:force_split",    2)

-- Layout: Master
hl.config("master:new_status", "master")

-- Misc - Nazuna theme background
hl.config("misc:background_color", "rgba(16141fff)")

-- Color scheme
hl.config("color-scheme", "prefer-dark")