local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- [[ appearance ]]
config.color_scheme = "Tokyo Night Storm"
config.color_scheme_dirs = { "~/.config/wezterm/colorschemes" }
config.window_background_opacity = 0.7
config.dpi = 144.0
config.enable_tab_bar = false
config.font = wezterm.font("OverpassM Nerd Font Mono", { weight = "ExtraBold" })
config.font_size = 8.5
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 10,
	top = 2,
	bottom = 2,
}

return config
