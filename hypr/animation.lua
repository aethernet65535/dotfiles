--###################
--## ANIMATIONS #####
--###################

-- Define bezier curve
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Window animations
hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "myBezier" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "slide" })

-- Border animations
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })

-- Fade animation
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })

-- Workspace animation
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Layout configurations
hl.config({
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})