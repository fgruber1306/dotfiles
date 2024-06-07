return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      -- follow latest release.
      version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    {
      'onsails/lspkind.nvim',
    },

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-cmdline',
    'ray-x/cmp-treesitter',
  },
  config = function()
    local cmp = require 'cmp'
    local ls = require 'luasnip'
    local lspkind = require 'lspkind'

    -- Loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    ls.config.setup {
      history = false,
      updateevents = 'TextChanged,TextChangedI',
    }

    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/custom/snippets/*.lua', true)) do
      loadfile(ft_path)()
    end

    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    cmp.setup {
      enabled = function()
        local buf = vim.api.nvim_get_current_buf()
        ---@diagnostic disable-next-line: deprecated
        local buf_filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
        local filetype_denylist = { 'neo-tree', 'neo-tree-popup', 'TelescopePrompt' }

        if require('utils').is_large_file(buf) or vim.tbl_contains(filetype_denylist, buf_filetype) then
          return false
        end

        return not vim.g.cmp_disable
      end,
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      window = {
      },
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-h>'] = cmp.mapping.close(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm { select = false },
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
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
    }
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
