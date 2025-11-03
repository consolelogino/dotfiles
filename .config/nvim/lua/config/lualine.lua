require('lualine').setup({
  options = {
    -- theme = custom_catppuccin(),
    globalstatus = true,

    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },

    disabled_filetypes = {
      tabline = { 'neo-tree' },
    },
  },

  sections = {
    lualine_a = {
      {
        'mode',
        padding = 1,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
