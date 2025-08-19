return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = function(_, opts)
    vim.keymap.set({ 'n', 'i', 's' }, '<C-j>', function()
      if not require('noice.lsp').scroll(4) then
        return '<C-j>zz'
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ 'n', 'i', 's' }, '<C-k>', function()
      if not require('noice.lsp').scroll(-4) then
        return '<C-k>zz'
      end
    end, { silent = true, expr = true })

    return vim.tbl_deep_extend('force', opts, {
      cmdline = {
        format = {
          search_down = { icon = ' ' },
          search_up = { icon = ' ' },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
      messages = {
        view = 'mini',
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      routes = {
        {
          filter = { max_width = 0 },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          filter_options = {},
          position = {
            col = '50%',
            row = '70%',
          },
        },
      },
    })
  end,
}
