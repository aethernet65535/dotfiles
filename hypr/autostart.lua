--################
--## AUTOSTART ###
--################

hl.on("hyprland.start", function()
    hl.exec_cmd("wl-paste --watch cliphist store &")
    hl.exec_cmd("fcitx5 --replace -d &")
    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("waybar &")
    hl.exec_cmd("xhost +SI:localuser:root &")
    hl.exec_cmd("syncthing --no-browser &")
    hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
end)
