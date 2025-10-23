local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function color_scheme_auto()
	if wezterm.gui.get_appearance():find("Light") then
		return "Catppuccin Latte"
	else
		return "Catppuccin Mocha"
	end
end

config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.cursor_blink_rate = 0

config.font = wezterm.font("Cascadia Code NF")
config.font_size = 16
config.harfbuzz_features = { "zero" }

config.color_scheme = color_scheme_auto()

return config
