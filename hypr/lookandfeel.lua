-- General
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,
        ["col.active_border"]   = { colors = { "rgba(b968c7ff)", "rgba(7b68eeff)" }, angle = 45 },
        ["col.inactive_border"] = "rgba(2d2a4eff)",
        layout = "dwindle",
        allow_tearing = true,
    },
    decoration = {
        rounding = 8,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            new_optimizations = true,
            noise = 0.05,
            contrast = 1.1,
            brightness = 1.0,
        },
    },
    misc = {
        background_color = "rgba(16141fff)"
    },
})
-- Enable animations
hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier beziers
hl.bezier("easeOutQuint",    { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.bezier("easeInOutCubic",  { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.bezier("linear",          { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.bezier("almostLinear",    { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.bezier("quick",           { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

-- Animations
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = false })

hl.config({
    dwindle = {
        pseudotile = true,
        preserve_split = true,
        force_split = 2,
    },
    master = {
        new_status = "master",
    },
})