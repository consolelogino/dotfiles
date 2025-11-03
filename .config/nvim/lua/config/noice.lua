require('noice').setup({
  cmdline = {
    view = 'cmdline',
    format = {
      cmdline = { pattern = '^:', icon = false, conceal = false, lang = 'vim' },
      search_down = { kind = 'search', pattern = '^/', icon = false, conceal = false, lang = 'regex' },
      search_up = { kind = 'search', pattern = '^%?', icon = false, conceal = false, lang = 'regex' },
    },
  },
})
