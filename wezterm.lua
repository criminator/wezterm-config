local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 10
config.color_scheme = "Arthur"

config.default_domain = "WSL:Ubuntu"

-- Modern OpenType feature syntax
config.font = wezterm.font_with_fallback({
	{
		family = "Cascadia Code PL",
		harfbuzz_features = {
			"calt=1",
			"liga=1",
			"ss01=1",
			"ss02=1",
			"ss03=1",
			"ss20=1",
		},
	},
})

config.font_rules = {
	{
		italic = true,
		font = wezterm.font_with_fallback({
			{
				family = "Cascadia Code PL",
				style = "Italic",
				harfbuzz_features = {
					"calt=1",
					"liga=1",
					"ss01=1",
					"ss02=1",
					"ss03=1",
					"ss20=1",
				},
			},
		}),
	},
}

config.keys = {
	{ key = "|", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
}

return config
