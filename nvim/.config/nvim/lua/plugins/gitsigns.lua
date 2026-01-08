return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 300,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  },
  keys = {
    { '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', desc = 'Toggle Git Blame' },
    { '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', desc = 'Preview Hunk' },
    { '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', desc = 'Reset Hunk', mode = { 'n', 'v' } },
    { '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', desc = 'Stage Hunk', mode = { 'n', 'v' } },
    { '[h', '<cmd>Gitsigns prev_hunk<CR>', desc = 'Previous Hunk' },
    { ']h', '<cmd>Gitsigns next_hunk<CR>', desc = 'Next Hunk' },
  },
}
