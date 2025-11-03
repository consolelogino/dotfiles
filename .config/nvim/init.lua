vim.opt.termguicolors = true -- Enable 24-bit colors

vim.opt.mouse = '' -- Disable mouse support
vim.opt.clipboard:append('unnamedplus') -- Use system clipboard

vim.opt.autoread = true -- Auto-reload file if changed outside
vim.opt.autowrite = false -- Don't auto-save on some events

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.signcolumn = 'yes:2'

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.encoding = 'UTF-8'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  space = '·',
  trail = '•',
  nbsp = '␣',
}

vim.opt.showmatch = true -- Highlight matching brackets

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<ESC>')

-- Center screen when jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

require('config.rooter')

require('config.lazy')

require('config.mini')
require('config.mason')
require('config.lint-format')
require('config.treesitter')
require('config.blink')

require('config.autopairs')
require('config.autotag')

require('config.kanso')
require('config.noice')
require('config.neo-tree')
require('config.lualine')
