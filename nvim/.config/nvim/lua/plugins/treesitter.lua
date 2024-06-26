return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require 'nvim-treesitter.configs'

    -- configure treesitter
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup { -- enable syntax highlighting
      auto_install = true,
      ignore_install = {},
      sync_install = false,
      highlight = {
        enable = true,
        disable = function(_, buf)
          if require('utils').is_large_file(buf) then
            return true
          end
        end,
        additional_vim_regex_highlighting = { 'html' },
      },
      -- enable indentation
      indent = {
        enable = true,
        disable = { 'html' },
      },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        'json',
        'javascript',
        'yaml',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'tmux',
        'bash',
        'diff',
        'scss',
        'typoscript',
        'csv',
        'http',
        'php',
        'regex',
        'sql',
        'lua',
        'vim',
        'dockerfile',
        'gitignore',
        'vimdoc',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'grl',
          node_decremental = 'grh',
          node_incremental = 'grl',
        },
      },
    }
  end,
}
