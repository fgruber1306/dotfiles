return {
  'stevearc/conform.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'nvim-lua/plenary.nvim' },
    { 'williamboman/mason.nvim' },
  },
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
        phtml = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        php = { 'php_cs_fixer' },
      },
    }

		local range_formatting = function()
				local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
				local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))

				-- If no range is selected, format the entire buffer
				if start_row == end_row then
						vim.lsp.buf.format()
				else
						vim.lsp.buf.format({
								range = {
										["start"] = { start_row, 0 },
										["end"] = { end_row, 0 },
								},
								async = true,
						})
				end
		end

		vim.keymap.set({ 'n', 'v', 'x' }, "<leader>F", range_formatting, { desc = "Range Formatting" })
  end,
}
