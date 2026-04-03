local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 11
-- config.color_scheme = "Afterglow"
-- config.color_scheme = "Ashes (dark) (terminal.sexy)"
-- config.color_scheme = "Atom (Gogh)"
-- config.color_scheme = "Azu (Gogh)"
-- config.color_scheme = "Builtin Pastel Dark"
-- config.color_scheme = "Darkside"
config.color_scheme = "Jellybeans"

-- config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--", "tmux" }
config.default_prog = {
	"wsl.exe",
	"-d",
	"Ubuntu",
	"--",
	"sh",
	"-c",
	"cd ~ && tmux",
}

config.font = wezterm.font("Cascadia Code PL")
--
-- -- Modern OpenType feature syntax
-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Cascadia Code PL",
-- 		harfbuzz_features = {
-- 			"calt=1",
-- 			"liga=1",
-- 			"ss01=1",
-- 			"ss02=1",
-- 			"ss03=1",
-- 			"ss20=1",
-- 		},
-- 	},
-- })

-- config.font_rules = {
-- 	{
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({
-- 			{
-- 				family = "Cascadia Code PL",
-- 				style = "Italic",
-- 				harfbuzz_features = {
-- 					"calt=1",
-- 					"liga=1",
-- 					"ss01=1",
-- 					"ss02=1",
-- 					"ss03=1",
-- 					"ss20=1",
-- 				},
-- 			},
-- 		}),
-- 	},
-- }

config.keys = {
	{ key = "|", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "_", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "H", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "J", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "K", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
}

return config
