local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.cursor_blink_rate = 0

config.font = wezterm.font("Cascadia Code NF")
config.font_size = 16
config.harfbuzz_features = { "zero" }

return config
