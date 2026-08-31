-- GLOBAL VARIABLES & CONSTANTS

-- APPLICATION VARIABLES
MainMod = "SUPER"
SecMod = "CTRL"
Terminal = "kitty"
FileManager = "dolphin"
Browser = "firefox"
Launcher = "wofi --show drun"

-- ENVIRONMENT VARIABLES
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- XWAYLAND CONFIGURATION
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

-- DARK MODE SETTINGS
hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"adw-gtk3\"")
end)