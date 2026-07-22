local wezterm = require("wezterm")

-- ─── Helpers ─────────────────────────────────────────────────────────────────

local function file_exists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

-- ─── Base config ─────────────────────────────────────────────────────────────

local config = wezterm.config_builder()

config.window_background_image = 'C:\\Users\\Jackson\\wallpaperwezterm.jpg'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.2,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

-- config.force_reverse_video_cursor = true
config.initial_cols = 120
config.initial_rows = 28
config.audible_bell = "Disabled"
config.check_for_updates = false
-- config.color_scheme = "Builtin Solarized Dark"
-- config.color_scheme = "Afterglow"
-- config.color_scheme = "Ashes (dark) (terminal.sexy)"
-- config.color_scheme = "Atom (Gogh)"
-- config.color_scheme = "Azu (Gogh)"
-- config.color_scheme = "Builtin Pastel Dark"
-- config.color_scheme = "Darkside"
-- config.color_scheme = "Jellybeans"
-- ─── Theme & Cursor Configuration ──────────────────────────────────────────

-- Option 1: High-contrast pastel (Highly Recommended)
config.color_scheme = "Catppuccin Mocha"

-- Option 2: Cyberpunk / deep blue (Uncomment this if you prefer it)
-- config.color_scheme = "Tokyo Night Storm"

-- Make the cursor stark white and clearly visible
config.colors = {
	-- Override the background to a much deeper, ink-like black
	background = "#11111b", -- Official Catppuccin 'Crust' (Deep pitch black)

	cursor_bg = "#FFFFFF",
	cursor_fg = "#000000", -- Text color inside the cursor block
	cursor_border = "#FFFFFF",
}

-- Force the cursor to stay a solid block and blink smoothly
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.cursor_blink_rate = 500
config.inactive_pane_hsb = { hue = 1.0, saturation = 1.0, brightness = 1.0 }
config.set_environment_variables = {}
config.launch_menu = {}

-- ─── Leader / keybindings ────────────────────────────────────────────────────
-- Leader is CTRL-A (tmux-style). Additional CTRL|SHIFT bindings for pane
-- splitting and navigation are also available without the leader.

-- config.leader = { key = "a", mods = "CTRL" }
-- config.disable_default_key_bindings = true

config.keys = {
	-- 	-- Pass CTRL-A through when pressed twice
	-- 	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	--
	-- 	-- Pane splitting (leader style)
	-- 	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- 	{ key = "\\", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Pane splitting (CTRL|SHIFT style — no leader needed)
	{ key = "_", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- -- Zoom / close
	-- { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	-- { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	-- { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },

	-- New tab / window
	-- { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "N", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },

	-- Pane navigation (leader)
	-- { key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	-- { key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	-- { key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	-- { key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

	-- Pane navigation (CTRL|SHIFT — no leader needed)
	{ key = "H", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "J", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "K", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Pane resize (leader + shift)
	-- { key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	-- { key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	-- { key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	-- { key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

	-- Tab switching
	-- { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	-- { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	-- { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	-- { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	-- { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	-- { key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	-- { key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	-- { key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	-- { key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },

	-- Fullscreen, clipboard, font size
	{ key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
	{ key = "v", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "+", mods = "SHIFT|CTRL", action = "IncreaseFontSize" },
	{ key = "-", mods = "SHIFT|CTRL", action = "DecreaseFontSize" },
	{ key = "0", mods = "SHIFT|CTRL", action = "ResetFontSize" },
}

-- ─── Platform-specific ───────────────────────────────────────────────────────

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Prefer EGL on hostnames starting with 'C' (e.g. certain corporate machines)
	if string.match(wezterm.hostname(), "^C") then
		config.prefer_egl = true
	end

	config.font_size = 13
	config.default_prog = { "pwsh.exe", "-NoLogo" }
	-- Swap with this if you want to use vs developer console as default
	-- config.default_prog = {
	-- 	"pwsh.exe",
	-- 	"-NoLogo",
	-- 	"-NoExit",
	-- 	"-Command",
	-- 	'& "C:\\Program Files\\Microsoft Visual Studio\\18\\Community\\Common7\\Tools\\Launch-VsDevShell.ps1"; cd ~',
	-- }

	-- CaskadiaCove Nerd Font Mono with full OpenType features
	config.font = wezterm.font_with_fallback({
		{
			-- family = "CaskaydiaCove Nerd Font Mono",
      family = "Consolas",
			-- family = "Iosevka Nerd Font Mono",
			-- harfbuzz_features = { "calt=1", "liga=1", "ss01=1", "ss02=1", "ss03=1", "ss20=1" },
		},
	})
	config.font_rules = {
		{
			italic = true,
			font = wezterm.font_with_fallback({
				{
					-- family = "CaskaydiaCove Nerd Font Mono",
          family = "Consolas"
					-- style = "Italic",
					-- harfbuzz_features = { "calt=1", "liga=1", "ss01=1", "ss02=1", "ss03=1", "ss20=1" },
				},
			}),
		},
	}

	-- Launch menu
	table.insert(
		config.launch_menu,
		{ label = "WSL (Ubuntu)", args = { "wsl.exe", "-d", "Ubuntu", "--", "sh", "-c", "cd ~ && tmux" } }
	)
	table.insert(config.launch_menu, { label = "Default (Windows)", args = { "pwsh.exe", "-NoLogo" } })
	table.insert(config.launch_menu, { label = "PowerShell Legacy", args = { "powershell.exe", "-NoLogo" } })
	table.insert(config.launch_menu, {
		label = "Developer Build Tools Console",
		args = {
			"pwsh.exe",
			"-NoLogo",
			"-NoExit",
			"-Command",
			'& "C:\\Program Files\\Microsoft Visual Studio\\18\\Community\\Common7\\Tools\\Launch-VsDevShell.ps1"; cd ~',
		},
	})

	-- Auto-detect installed Visual Studio versions
	for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
		local year = vsvers:gsub("Microsoft Visual Studio/", "")
		table.insert(config.launch_menu, {
			label = "x64 Native Tools VS " .. year,
			args = {
				"cmd.exe",
				"/k",
				"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
			},
		})
	end
else
	-- macOS / Linux
	config.font_size = 16.0

	local fish_bin_path = "/bin/fish"
	if file_exists("/opt/homebrew/bin/fish") then
		fish_bin_path = "/opt/homebrew/bin/fish"
		config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
	else
		config.default_prog = { "/bin/bash", "-l" }
	end

	table.insert(config.launch_menu, { label = "fish", args = { fish_bin_path, "-l" } })
	table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })
end

-- ─────────────────────────────────────────────────────────────────────────────

-- Mouse click opening window glitch
config.swallow_mouse_click_on_window_focus = true
return config
