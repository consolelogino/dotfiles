require('blink.cmp').setup({
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },
  completion = {

    list = { selection = { preselect = false, auto_insert = true } },
  },
  cmdline = {
    completion = {
      menu = {
        auto_show = true,
      },
    },
  },
})
