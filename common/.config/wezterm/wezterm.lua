-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Style
config.font = wezterm.font("GeistMono Nerd Font Mono")
config.font_size = 10
config.color_scheme = "Catppuccin Mocha"

-- Tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 20

-- Finally, return the configuration to wezterm:
return config
