return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
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
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        php = { 'easy-coding-standard' },
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

