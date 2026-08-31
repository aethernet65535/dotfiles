--######################
--## HYPRLAND CONFIG ###
--######################

-- Load modules
require("var")
require("autostart")
require("keymap")
require("animation")
require("workspace_mode")

-- Main configuration
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 9,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(cceeffbb)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    cursor = {
        inactive_timeout = 3,
    },
    decoration = {
        rounding = 3,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = false,
            size = 5,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})