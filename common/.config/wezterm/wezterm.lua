-- Pull in the wezterm API
local wezterm = require("wezterm")
local workspace_manager = wezterm.plugin.require("https://github.com/ryanmsnyder/workspace-manager.wezterm")

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = "CTRL" },
				}, pane)
			else
				win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
			end
		end),
	}
end

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Style
config.font = wezterm.font("GeistMono Nerd Font Mono")
config.font_size = 12
config.color_scheme = "Catppuccin Mocha"

-- Tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 20

-- Keybinds
config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL" }

config.keys = {
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateLastTab },
	{ key = "phys:1", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
	{ key = "phys:2", mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
	{ key = "phys:3", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
	{ key = "phys:4", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
	{ key = "phys:5", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
	{ key = "phys:6", mods = "SHIFT|CTRL", action = act.ActivateTab(5) },
	{ key = "phys:7", mods = "SHIFT|CTRL", action = act.ActivateTab(6) },
	{ key = "phys:8", mods = "SHIFT|CTRL", action = act.ActivateTab(7) },
	{ key = "phys:9", mods = "SHIFT|CTRL", action = act.ActivateTab(8) },
	{ key = "{", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) }, -- SHIFT + CTRL + [
	{ key = "}", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(1) }, -- SHIFT + CTRL + ]
	{ key = "{", mods = "SHIFT|CTRL|ALT", action = act.MoveTabRelative(-1) }, -- SHIFT + CTRL + [
	{ key = "}", mods = "SHIFT|CTRL|ALT", action = act.MoveTabRelative(1) }, -- SHIFT + CTRL + ]

	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),

	{ key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "p", mods = "CTRL", action = act.ActivateKeyTable({ name = "panes", one_shot = false }) },

	{ key = "phys:0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
	{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
	{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize }, -- SHIFT + CTRL + -

	-- { key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },

	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{ key = "P", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{
		key = "U",
		mods = "SHIFT|CTRL",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
	{ key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
	{ key = "K", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
	{ key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },

	{ key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
	{
		key = "p",
		mods = "ALT",
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"https?://\\S+",
			},
			-- skip_action_on_paste = true,
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},

	{ key = "PageUp", mods = "SHIFT|CTRL", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "SHIFT|CTRL", action = act.ScrollByPage(1) },
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	panes = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.ActivatePaneDirection("Down") },

		{ key = "v", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "s", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "r", action = act.RotatePanes("Clockwise") },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

workspace_manager.session_enabled = true
workspace_manager.session_restore_on_startup = true

workspace_manager.apply_to_config(config)

-- Finally, return the configuration to wezterm:
return config
