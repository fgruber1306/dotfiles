return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = false },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = { enabled = false },
    debug = { enabled = false },
    dim = { enabled = false },
    explorer = { enabled = true }, -- TODO
    git = { enabled = true }, -- TODO
    gitbrowse = { enabled = true }, -- TODO
    image = { enabled = true }, -- TODO
    indent = { enabled = true },
    input = { enabled = true }, -- TODO
    lazygit = { enabled = true }, -- TODO
    notifier = { -- TODO
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      formatters = {
        file = {
          truncate = 200,
        },
      },
      layout = {
        preset = 'vertical',
        layout = {
          width = 0.8,
        },
      },
      sources = {
        explorer = {
          auto_close = true,
          exclude = {
            '.DS_Store',
          },
          git_status_open = true,
          hidden = true,
          ignored = true,
          layout = {
            preset = 'default',
            preview = true,
            layout = {
              width = 0.95,
              height = 0.9,
            },
          },
        },
      },
    },
    quickfile = { enabled = true },
    rename = { enabled = true }, -- TODO
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true }, -- TODO
    terminal = { enabled = false }, -- TODO
    toggle = { enabled = true }, -- TODO
    util = { enabled = false },
    win = { enabled = true }, -- TODO
    words = { enabled = true }, -- TODO
    zen = { enabled = true }, -- TODO
  },
  keys = {
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader><space>',
      mode = 'n',
      function()
        require('snacks.picker').files { hidden = true }
      end,
      desc = 'Find files',
    },
    {
      '<leader>fa',
      mode = 'n',
      function()
        require('snacks.picker').files { hidden = true, ignored = true }
      end,
      desc = 'Find all files',
    },
    {
      '<leader>/',
      mode = 'n',
      function()
        require('snacks.picker').grep { hidden = true }
      end,
      desc = 'Search in files',
    },
    {
      '<leader>?',
      mode = 'n',
      function()
        require('snacks.picker').grep { hidden = true, ignored = true }
      end,
      desc = 'Search in all files',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Git Status',
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader><CR>',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>Z',
      function()
        Snacks.zen.zoom()
      end,
      desc = 'Toggle Zoom',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    {
      '<leader>cR',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>uD'
      end,
    })
  end,
}
