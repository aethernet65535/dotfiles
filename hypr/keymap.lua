-----------------
--- WORKSPACE ---
-----------------

-- Switch workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(SecMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace
for i = 1, 10 do
    local key = i % 10
    hl.bind(SecMod .. " + " .. MainMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(SecMod .. " + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SecMod .. " + h", hl.dsp.focus({ workspace = "e-1" }))

---------------
--- WINDOWS ---
---------------

-- Move focus with mainMod + arrow keys
hl.bind(MainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(MainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(MainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(MainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(MainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- Resize
hl.bind(MainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
end)

--############
--## UTILS ###
--############

-- Hot-Keys
hl.bind(MainMod .. " + q", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + c", hl.dsp.window.close())
hl.bind(MainMod .. " + e", hl.dsp.exec_cmd(FileManager))
hl.bind(MainMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(MainMod .. " + space", hl.dsp.exec_cmd(Launcher))

-- Screenshot
hl.bind(MainMod .. " + SHIFT + s",
    hl.dsp.exec_cmd(
        "grim - | wl-copy && wl-paste >/home/user/65535/pictures/computer/screenshot/$(date +%F_%T).png | dunstify \"Screenshot of whole screen taken\" -t 1000"))

-- Clipboard
hl.bind("SUPER + v", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

-- kaomoji
hl.bind("SUPER + menu",
    hl.dsp.exec_cmd(
        "wofi --show dmenu -i --width=600 --height=500 --prompt \"KaoMoJi→\" < ~/65535/workspace/lab/kaomoji_wofi/kaomoji.txt | wl-copy"))

-- workspace_mode (laptop/desktop)
hl.bind("CTRL + SHIFT + l", hl.dsp.exec_cmd("~/.config/hypr/workspace_mode/switch_workspace.sh laptop"))
hl.bind("CTRL + SHIFT + d", hl.dsp.exec_cmd("~/.config/hypr/workspace_mode/switch_workspace.sh desktop"))

--############
--## DEBUG ###
--############

-- Exit Hyprland
hl.bind(MainMod .. " + m", hl.dsp.exit())

-- Restart waybar
hl.bind(MainMod .. " + SHIFT + w", hl.dsp.exec_cmd("sh -c \"killall waybar; waybar\""))

--#########################
--## AUDIO & BRIGHTNESS ###
--#########################

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Black screen
hl.bind("SUPER + b", hl.dsp.exec_cmd("hyprctl dispatch dpms off"))
hl.bind("SUPER + l", hl.dsp.exec_cmd("hyprctl dispatch dpms on"))

