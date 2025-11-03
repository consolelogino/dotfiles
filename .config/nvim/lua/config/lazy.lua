local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { 'nvim-mini/mini.nvim', version = false },

    { 'neovim/nvim-lspconfig' },
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },

    { 'mfussenegger/nvim-lint' },
    { 'stevearc/conform.nvim' },

    {
      'nvim-treesitter/nvim-treesitter',
      branch = 'master',
      lazy = false, -- does not support lazy loading
      build = ':TSUpdate',
    },

    { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },
    { 'windwp/nvim-ts-autotag', event = 'BufReadPre' },
    {

      'saghen/blink.cmp',
      version = '1.*', -- uses a release tag to download pre-built binaries
    },

    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },

    {
      'folke/noice.nvim',
      event = 'VeryLazy',
      dependencies = {
        'MunifTanjim/nui.nvim',
      },
    },
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      lazy = false, -- lazily loads itself
      dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
      },
    },
    {
      'nvim-lualine/lualine.nvim',
    },
    {
      'webhooked/kanso.nvim',
      lazy = false,
      priority = 1000,
    },
    -- { "xiyaowong/transparent.nvim", lazy = false },

    -- { import = "plugins" }
  },

  checker = {
    enabled = true,
    notify = false,
  },

  ui = {
    pills = false,
  },
})
