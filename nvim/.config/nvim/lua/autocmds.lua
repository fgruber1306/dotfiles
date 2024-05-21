-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Handle trailing whitespaces and empty lines ]]
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  callback = function()
    require('utils').trim_whitespaces()
    require('utils').trim_empty_lines()
  end,
})

-- [[ Handle large files ]]
vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = { '*' },
  group = vim.api.nvim_create_augroup('bigfile', {}),
  callback = function(args)
    local match = require('utils').is_large_file(args.buf)

    if match then
      vim.opt_local.foldmethod = 'manual'
      vim.opt_local.swapfile = false
      vim.opt_local.undolevels = -1
      vim.opt_local.undoreload = 0

      vim.cmd 'filetype off'
      vim.cmd 'syntax off'
    else
      vim.cmd 'filetype on'
      vim.cmd 'syntax on'
    end
  end,
})
