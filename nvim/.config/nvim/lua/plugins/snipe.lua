local producers = {}
local callbacks = {}

return {
  'leath-dub/snipe.nvim',
  config = function()
    local snipe = require 'snipe'

    producers = {
      buffer_menu = function()
        local bufnrs, bufnames = snipe.buffer_producer()
        local cur_buf = vim.api.nvim_get_current_buf()

        for index, bufnr in ipairs(bufnrs) do
          if bufnr == cur_buf then
            table.remove(bufnrs, index)
            table.remove(bufnames, index)
          end
        end

        return bufnrs, bufnames
      end,
    }

    callbacks = {
      buffer_menu = function(bufnr, _)
        vim.api.nvim_set_current_buf(bufnr)
      end,
      grapple_menu = function() end,
    }

    snipe.setup {
      ui = {
        position = 'center',
      },
    }
  end,
  keys = {
    {
      '<leader><space>',
      mode = 'n',
      function()
        require('snipe').create_menu_toggler(producers.buffer_menu, callbacks.buffer_menu)()
      end,
      desc = 'Open buffer menu',
    },
  },
}
