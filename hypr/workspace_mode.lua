--###############
--## MONITORS ###
--###############

-- Monitor configurations
hl.monitor({
    output = "eDP-1",
    disabled = true,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

--############
--## INPUT ###
--############

-- Gesture configuration
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
})

-- Device configuration
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Input settings
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        accel_profile = "flat",
        sensitivity = -0.2,
        touchpad = {
            natural_scroll = true,
        },
        repeat_delay = 300,
        repeat_rate = 50,
    },
})