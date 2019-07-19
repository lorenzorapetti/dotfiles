-----------------------------
-- DWV's AWESOME THEME 3.5 --
-----------------------------

theme = {}

-- theme.font          = "sans 8"
theme.font          = "lemon 7"
theme.font_alt      = "-*-lemon-*-*-*-*-*-*-*-*-*-*-*-*"

theme.bg_normal     = "#14101C" -- #14101C
theme.bg_focus      = "#282333" -- #282333
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaa5ad"
theme.fg_focus      = "#d6ccdc"
theme.fg_urgent     = "#d6ccdc"
theme.fg_minimize   = "#4b464f"

theme.border_width  = 3
theme.border_normal = "#E3DCE5" --#EEECEE E0D5E5
theme.border_focus  = "#FEFDFF" --#BAB3D0
theme.border_marked = "#FEFDFF" --#F5E9F0

theme.useless_gap_width = 10

--theme.textbox_widget_margin_top     = 1

--theme.awful_widget_height           = 14
--theme.awful_widget_margin_top       = 10
--theme.awful_widget_margin_bottom    = 10
--theme.awful_widget_margin_left      = 10
--theme.awful_widget_margin_right     = 10

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.taglist_bg_focus = "#282333" --#181C29 || 0E1017

-- Display the taglist squares
theme.taglist_squares_sel = "~/.config/awesome/theme/taglist/squareln-fg.png"
theme.taglist_squares_unsel = "~/.config/awesome/theme/taglist/squareln-g.png"

theme.tasklist_disable_icon = true

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

theme.menu_bg_normal = "#282333" --0B0B12
theme.menu_bg_focus = "#524C59" --BAB3D0 151324

theme.menu_fg_normal = "#aaa5ad"
theme.menu_fg_focus = "#d6ccdc"

theme.menu_border_width = 0
theme.menu_border_color = "#ECE1E7" --#0B0B12

theme.menu_submenu_icon = "~/.config/awesome/theme/submenu4.png"
theme.menu_height = 15
theme.menu_width  = 105

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "~/.config/awesome/theme/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/theme/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/theme/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/theme/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/theme/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/theme/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/theme/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/theme/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/theme/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/theme/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/theme/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/theme/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/theme/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/theme/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/theme/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/theme/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/theme/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/theme/titlebar/maximized_focus_active.png"

--theme.wallpaper = config_dir .. "/theme/wallpaper-1624678.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/theme/layouts/fairhw.png"
theme.layout_fairv = "~/.config/awesome/theme/layouts/fairvw.png"
theme.layout_floating  = "~/.config/awesome/theme/layouts/floatingw.png"
theme.layout_magnifier = "~/.config/awesome/theme/layouts/magnifierw.png"
theme.layout_max = "~/.config/awesome/theme/layouts/maxw.png"
theme.layout_fullscreen = "~/.config/awesome/theme/layouts/fullscreenw.png"
theme.layout_tilebottom = "~/.config/awesome/theme/layouts/tilebottomw.png"
theme.layout_tileleft   = "~/.config/awesome/theme/layouts/tileleftw.png"
theme.layout_tile = "~/.config/awesome/theme/layouts/tilew.png"
theme.layout_tiletop = "~/.config/awesome/theme/layouts/tiletopw.png"
theme.layout_spiral  = "~/.config/awesome/theme/layouts/spiralw.png"
theme.layout_dwindle = "~/.config/awesome/theme/layouts/dwindlew.png"

theme.awesome_icon = "~/.config/awesome/theme/awesome-launcher.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from ~/.config/icons and ~/.config/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

