require('neo-tree').setup({
  enable_cursor_hijack = true,
  hide_root_node = true,

  event_handlers = {
    {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
        vim.opt_local.cursorline = true
        vim.opt_local.cursorlineopt = 'both'
        vim.opt_local.signcolumn = 'no'
      end,
    },
  },

  default_component_configs = {
    indent = {
      padding = 0,
      with_markers = false,
      with_expanders = false,
    },

    icon = {
      folder_closed = '  ',
      folder_open = '  ',
      folder_empty = '  ',
      folder_empty_open = '  ',

      provider = function(icon, node, state)
        icon.text = '  '
      end,
    },
  },

  window = {
    mappings = {
      ['h'] = function(state)
        local node = state.tree:get_node()
        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
        end
      end,

      ['l'] = function(state)
        local node = state.tree:get_node()
        if node:has_children() then
          if not node:is_expanded() then
            state.commands.toggle_node(state)
          else
            if node.type == 'file' then
              state.commands.open(state)
            else
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          end
        else
          state.commands.open(state)
        end
      end,
    },
  },

  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})
vim.api.nvim_create_augroup('neotree', {})
vim.api.nvim_create_autocmd('UiEnter', {
  group = 'neotree',
  callback = function()
    vim.cmd('Neotree')
  end,
})

vim.keymap.set('n', '<leader>e', function()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd.wincmd('p')
  else
    vim.cmd.Neotree('focus')
  end
end)
