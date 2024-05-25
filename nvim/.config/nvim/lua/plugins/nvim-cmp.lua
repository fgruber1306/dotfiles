return {
  'hrsh7th/nvim-cmp',
  dependencies = {
		'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    -- Snippet Engine & its associated nvim-cmp source
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    {
      'onsails/lspkind.nvim',
      config = function()
        require('lspkind').init {
          symbol_map = {
            Color = '󰌁',
            Copilot = '',
            String = '',
          },
        }
      end,
    },

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-cmdline',
    'ray-x/cmp-treesitter',
  },
  config = function()
    local cmp = require("cmp")
    local ls = require("luasnip")
    local lspkind = require("lspkind")

    -- Loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

		-- Adjust border
    local border_opts = {
      border = 'single',
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
    }

    ls.config.setup {}

    cmp.setup {
      enabled = function()
        local buf = vim.api.nvim_get_current_buf()
        local buf_filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
        local filetype_denylist = { 'neo-tree', 'neo-tree-popup', 'TelescopePrompt' }

        if require('utils').is_large_file(buf) or vim.tbl_contains(filetype_denylist, buf_filetype) then
          return false
        end

        return not vim.g.cmp_disable
      end,
      window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      },
      mapping = cmp.mapping.preset.insert {
				['<C-c>'] = cmp.mapping.complete(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 900 },
        { name = 'nvim_lsp_signature_help', priority = 800 },
        { name = 'buffer', priority = 700 },
        {
          name = 'path',
          priority = 600,
          option = {
            trailing_slash = true,
          },
        },
        { name = 'treesitter', priority = 500 },
      },
			-- configure lspkind for vs-code like pictograms in cmp
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
    }
  end,
}

