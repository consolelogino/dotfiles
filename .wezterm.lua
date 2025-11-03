local wezterm = require('wezterm')
local config = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- config.window_content_alignment = {
--   horizontal = 'Center',
--   vertical = 'Center',
-- }

config.window_decorations = 'RESIZE'
config.enable_tab_bar = false

config.cursor_blink_rate = 0

config.font_size = 16
config.font = wezterm.font({
  family = 'Cascadia Code NF',
  harfbuzz_features = {
    'clig=0',
    'liga=0',
    'calt=0',
    'ss19', -- slashed zero
  },
})

config.colors = {
  foreground = '#C5C9C7',
  background = '#14171d',

  cursor_bg = '#C5C9C7',
  cursor_fg = '#14171d',
  cursor_border = '#C5C9C7',

  selection_fg = '#C5C9C7',
  selection_bg = '#393B44',

  ansi = {
    '#14171d',
    '#C4746E',
    '#8A9A7B',
    '#C4B28A',
    '#8BA4B0',
    '#A292A3',
    '#8EA4A2',
    '#A4A7A4',
  },
  brights = {
    '#A4A7A4',
    '#E46876',
    '#87A987',
    '#E6C384',
    '#7FB4CA',
    '#938AA9',
    '#7AA89F',
    '#C5C9C7',
  },
}

return config
