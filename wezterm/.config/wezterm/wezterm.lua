local wezterm = require("wezterm")
local tab = require("tab")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13

config.window_decorations = "RESIZE"
-- config.use_fancy_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.color_scheme = "Tokyo Night Moon"

tab.setup(config)

return config
