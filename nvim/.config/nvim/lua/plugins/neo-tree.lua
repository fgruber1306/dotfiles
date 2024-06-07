return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      opts = {
        override = {
          tsconfig = {
            icon = '',
            color = '#8c8c8c',
            name = 'TSconfig',
          },
          typoscript = {
            icon = '',
            color = '#FF8700',
            name = 'TypoScript',
          },
        },
      },
    },
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  keys = {
    { '<leader>e', mode = 'n', '<cmd>Neotree current toggle reveal float<cr>', desc = 'Toggle NeoTree' },
    { '<leader>E', mode = 'n', '<cmd>Neotree current toggle reveal<cr>', desc = 'Toggle NeoTree' },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'single',
    enable_git_status = true,
    enable_modified_markers = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    default_component_configs = {
      indent = {
        with_markers = true,
        with_expanders = true,
      },
      modified = {
        symbol = ' ',
        highlight = 'NeoTreeModified',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
        folder_empty_open = '',
      },
      git_status = {
        symbols = {
          -- Change type
          added = '',
          deleted = '',
          modified = '',
          renamed = '',
          -- Status type
          untracked = '',
          ignored = '',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
    },
    window = {
      position = 'float',
      width = 35,
      mappings = {
        ['P'] = { "toggle_preview", config = { use_float = true, use_image_nvim = true }, -- TODO: Wait until core bug is fixed
        },
      },
    },
    filesystem = {
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {
          '.DS_Store',
          'thumbs.db',
        },
      },
    },
  },
}
