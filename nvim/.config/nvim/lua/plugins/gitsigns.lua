return {
  'lewis6991/gitsigns.nvim',
  event = 'BufEnter',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  keys = {
    {
      '<leader>hv',
      mode = 'n',
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = 'Preview hunk',
    },
    {
      '<leader>hr',
      mode = 'n',
      function()
        require('gitsigns').reset_hunk()
      end,
      desc = 'Reset hunk',
    },
    {
      '<leader>hs',
      mode = 'n',
      function()
        require('gitsigns').stage_hunk()
      end,
      desc = 'Stage hunk',
    },
    {
      '<leader>hu',
      mode = 'n',
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      desc = 'Undo stage',
    },
    {
      '<leader>hd',
      mode = 'n',
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'Show diff',
    },
    {
      ']h',
      mode = 'n',
      function()
        if vim.wo.diff then
          return ']h'
        end
        vim.schedule(function()
          require('gitsigns').next_hunk()
          vim.wait(10)
          vim.cmd 'norm zz'
        end)
        return '<Ignore>'
      end,
      desc = 'Go to next hunk',
    },
    {
      '[h',
      mode = 'n',
      function()
        if vim.wo.diff then
          return '[h'
        end
        vim.schedule(function()
          require('gitsigns').prev_hunk()
          vim.wait(10)
          vim.cmd 'norm zz'
        end)
        return '<Ignore>'
      end,
      desc = 'Go to previous hunk',
    },
    { 'ih', mode = { 'o', 'x' }, ':<C-U>Gitsigns select_hunk<CR>', desc = 'inner hunk' },
  },
}
