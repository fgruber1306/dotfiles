return {
  'stevearc/conform.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'nvim-lua/plenary.nvim' },
    { 'williamboman/mason.nvim' },
  },
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>bf',
      function()
        require('conform').format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1001,
        }
      end,
      { desc = 'Format file or range (in visual mode)' },
    },
  },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        phtml = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        php = { 'php_cs_fixer' },
      },
    }

    vim.keymap.set({ 'n', 'v', 'x' }, '<leader>bf', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1001,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
