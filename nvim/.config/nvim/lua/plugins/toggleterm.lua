-- toggleterm.lua

return {
  'akinsho/toggleterm.nvim',
  event = 'VimEnter',
  opts = {
    size = 10,
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = 'float',
    float_opts = { border = "rounded" },
  },
  keys = {
    { '<leader>tf', mode = 'n', '<cmd>ToggleTerm direction=float<cr>', desc = 'ToggleTerm float' },
    { '<leader>th', mode = 'n', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'ToggleTerm horizontal split' },
    { '<leader>tv', mode = 'n', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'ToggleTerm vertical split' },
    { '<leader>tl', mode = 'n', function () require('utils.lazygit').toggle_term_cmd 'lazygit' end, desc = 'ToggleTerm LazyGit' },
  },
}
