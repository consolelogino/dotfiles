vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg ~= '' then
      vim.g._previous_dir = vim.fn.getcwd()
      if vim.fn.isdirectory(arg) == 1 then
        vim.cmd('cd ' .. arg)
      elseif vim.fn.filereadable(arg) == 1 then
        vim.cmd('cd ' .. vim.fn.fnamemodify(arg, ':h'))
      end
    end
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    if vim.g._previous_dir and vim.fn.isdirectory(vim.g._previous_dir) == 1 then
      vim.cmd('cd ' .. vim.g._previous_dir)
    end
  end,
})
