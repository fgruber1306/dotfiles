return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    keys = {
      { '<leader>ce', mode = 'n', '<cmd>CopilotChatOpen<cr>', desc = 'Open CopilotChat in a vertical split' },
      {
        '<leader>cf',
        mode = 'n',
        function()
          require('CopilotChat').open {
            window = {
              layout = 'float',
              title = 'CopilotChat',
              border = 'single',
              width = 160,
              height = 40,
            },
          }
        end,
        desc = 'Open CopilotChat in a float',
      },
      { '<leader>cq', mode = 'n', '<cmd>CopilotChatClose<cr>', desc = 'Close CopilotChat' },
      { '<leader>cs', mode = 'n', '<cmd>CopilotChatStop<cr>', desc = 'Stop current CopilotChat output' },
      { '<leader>cr', mode = 'n', '<cmd>CopilotChatReset<cr>', desc = 'Reset current CopilotChat window' },
      {
        '<leader>ca',
        mode = { 'v', 'x' },
        function()
          local actions = require 'CopilotChat.actions'
          local selection = require('CopilotChat.select').visual

          actions.pick(actions.prompt_actions {
            selection = selection,
          })
        end,
        desc = 'Pick from CopilotChat prompts',
      },
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
