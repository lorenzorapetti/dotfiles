-- Skip setting environment variables if we're running in a UWSM-managed environment, as UWSM will handle that for us.
if os.getenv 'UWSM_MANAGED' == '1' then
  return
end

hl.env('XCURSOR_SIZE', '24')
hl.env('XCURSOR_THEME', 'catppuccin-mocha-lavender-cursors')
hl.env('HYPRCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_THEME', 'catppuccin-mocha-lavender-cursors')

hl.env('QT_QPA_PLATFORMTHEME', 'qt6ct')
hl.env('QT_WAYLAND_DISABLE_WINDOWDECORATION', '1')
hl.env('ELECTRON_OZONE_PLATFORM_HINT', 'auto')

hl.env('GDK_BACKEND', 'wayland')
hl.env('QT_QPA_PLATFORM', 'wayland;xcb')
hl.env('SDL_VIDEODRIVER', 'wayland')
hl.env('CLUTTER_BACKEND', 'wayland')

hl.env('XDG_CURRENT_DESKTOP', 'Hyprland')
hl.env('XDG_SESSION_TYPE', 'wayland')
hl.env('XDG_SESSION_DESKTOP', 'Hyprland')
