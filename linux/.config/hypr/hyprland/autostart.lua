-- Possible values: 'noctalia', 'waybar', 'ashell'
local bar = 'noctalia'

hl.on('hyprland.start', function()
  hl.exec_cmd 'sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP'
  hl.exec_cmd 'gnome-keyring-daemon --start --components=secrets'
  hl.exec_cmd 'systemctl --user start hyprpolkitagent'

  hl.exec_cmd 'hypridle'
  hl.exec_cmd 'nm-applet'
  hl.exec_cmd 'blueman-applet'
  hl.exec_cmd 'udiskie'
  hl.exec_cmd 'kanshi'

  if bar == 'noctalia' then
    hl.exec_cmd 'qs -c noctalia-shell'
  elseif bar == 'waybar' then
    hl.exec_cmd '$HOME/.config/waybar/waybar-hypr.sh'
    hl.exec_cmd 'dunst'
  elseif bar == 'ashell' then
    hl.exec_cmd 'ashell'
  end

  hl.exec_cmd 'awww-daemon'
  hl.exec_cmd 'vicinae server'
  hl.exec_cmd '1password --silent'
end)
