-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
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
      { '<leader>hv', mode = 'n', function () require('gitsigns').preview_hunk() end, desc = 'Preview hunk' },
      { '<leader>hr', mode = 'n', function () require('gitsigns').reset_hunk() end, desc = 'Reset hunk' },
      { '<leader>hs', mode = 'n', function () require('gitsigns').stage_hunk() end, desc = 'Stage hunk' },
      { '<leader>hu', mode = 'n', function () require('gitsigns').undo_stage_hunk() end, desc = 'Undo stage' },
      { '<leader>hd', mode = 'n', function () require('gitsigns').diffthis() end, desc = 'Show diff' },
    },
  },
}
