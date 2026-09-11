hl.on("hyprland.start", function()
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("systemctl --user enable --now easyeffects")
    hl.exec_cmd("hyprctl setcursor Moga-Black 24")
    -- Применение настроек тем оформления, шрифтов и курсора через nwg-look для GTK-приложений
    hl.exec_cmd("nwg-look -a")
  hl.exec_cmd("serpantinumd start")
end)
