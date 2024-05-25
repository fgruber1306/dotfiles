return {
  'nvim-neo-tree/neo-tree.nvim',
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
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
  },
	keys = {
    { '<leader>e', mode = 'n', '<cmd>Neotree current toggle reveal<cr>', desc = 'Toggle NeoTree' }
  },
}

