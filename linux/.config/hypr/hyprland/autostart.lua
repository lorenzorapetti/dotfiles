-- Possible values: 'noctalia', 'waybar', 'ashell', 'wayle'
local bar = 'noctalia'

hl.on('hyprland.start', function()
  hl.exec_cmd 'gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"'
  hl.exec_cmd 'gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"'

  hl.exec_cmd 'sleep 1 && dbus-update-activation-environment --systemd --all'
  hl.exec_cmd 'gnome-keyring-daemon --start --components=secrets'

  if bar == 'noctalia' then
    hl.exec_cmd 'runapp noctalia'
  else
    hl.exec_cmd 'systemctl --user start hyprpolkitagent'
  end

  if os.getenv 'UWSM_MANAGED' ~= '1' then
    hl.exec_cmd 'hypridle'
    hl.exec_cmd 'udiskie'

    if bar == 'noctalia' then
      hl.exec_cmd 'qs -c noctalia-shell'
    elseif bar == 'wayle' then
      hl.exec_cmd 'wayle panel start'
    elseif bar == 'waybar' then
      hl.exec_cmd '$HOME/.config/waybar/waybar-hypr.sh'
      hl.exec_cmd 'dunst'
      hl.exec_cmd 'awww-daemon'
      hl.exec_cmd 'nm-applet'
      hl.exec_cmd 'blueman-applet'
    elseif bar == 'ashell' then
      hl.exec_cmd 'ashell'
      hl.exec_cmd 'awww-daemon'
      hl.exec_cmd 'nm-applet'
      hl.exec_cmd 'blueman-applet'
    end

    hl.exec_cmd '1password --silent'
    hl.exec_cmd 'vicinae server'
  end
end)
