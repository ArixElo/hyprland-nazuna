-- Force all apps to use Wayland
hl.env("GDK_BACKEND",                "wayland,x11,*")
hl.env("QT_QPA_PLATFORM",            "wayland;xcb")
hl.env("STYLE_OVERRIDE",             "kvantum")
hl.env("SDL_VIDEODRIVER",            "wayland")
hl.env("MOZ_ENABLE_WAYLAND",         "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","wayland")
hl.env("OZONE_PLATFORM",             "wayland")
hl.env("XDG_SESSION_TYPE",           "wayland")

-- Screen sharing
hl.env("XDG_CURRENT_DESKTOP",  "Hyprland")
hl.env("XDG_SESSION_DESKTOP",  "Hyprland")

-- Cursor & theme
hl.env("XCURSOR_SIZE",          "24")
hl.env("HYPRCURSOR_SIZE",       "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GTK_THEME",             "Adwaita:dark")

-- XCompose
hl.env("XCOMPOSEFILE", "~/.XCompose")

-- Config
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
    ecosystem = {
        no_update_news = true,
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = true,
    },
})