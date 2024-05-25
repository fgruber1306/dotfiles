return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'f-person/git-blame.nvim',
			'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    opts = function(_, opts)
      local gitblame = require 'gitblame'

      opts.options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = '', right = '' },
        always_divide_middle = true,
      }

      opts.tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          {
            gitblame.get_current_blame_text,
            cond = gitblame.is_blame_text_available,
          },
        },
      }

      opts.sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename', require('utils.lualine').maximize_status },
        lualine_x = { require('utils.lualine').get_lsps, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      }

      return opts
    end,
  },
}

