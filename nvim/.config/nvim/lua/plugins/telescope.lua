-- telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "folke/noice.nvim",
    "folke/which-key.nvim",
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  keys = {
    { "<leader>,", mode = { "n" }, false },
    { "<leader>:", mode = { "n" }, false },
    { "<leader>s", mode = { "n" }, false },
    { "<leader>sa", mode = { "n" }, false },
    { "<leader>sc", mode = { "n" }, false },
    { "<leader>sH", mode = { "n" }, false },
    { "<leadec>so", mode = { "n" }, false },
    { "<leader>so", mode = { "n" }, false },
    { "<leader>sw", mode = { "n" }, false },
    { "<leader>sW", mode = { "n" }, false },
  },
  opts = function(_, opts)
    require("telescope").load_extension("noice")

    require("which-key").register({
      f = {
        name = "󰍉 Find",
        f = {
          function()
            require("utils.telescope").dir_picker({
              show_preview = true,
              hidden = false,
              no_ignore = false,
            }, require("telescope.builtin").find_files, false)
          end,
          "Find files",
        },
        F = {
          function()
            require("utils.telescope").dir_picker({
              show_preview = true,
              hidden = true,
              no_ignore = true,
              no_ignore_parent = true,
            }, require("telescope.builtin").find_files, false)
          end,
          "Find all files",
        },
        c = {
          function()
            require("telescope.builtin").git_commits()
          end,
          "Find commits",
        },
        B = {
          function()
            require("telescope.builtin").git_branches()
          end,
          "Find branches",
        },
        b = {
          function()
            require("utils.telescope").buffers()
          end,
          "Find existing buffers",
        },
        d = {
          function()
            require("telescope.builtin").diagnostics()
          end,
          "Find diagnostics",
        },
        g = {
          function()
            require("telescope.builtin").git_files()
          end,
          "Find git files",
        },
        w = {
          function()
            require("utils.telescope").dir_picker({
              show_preview = true,
              hidden = false,
              no_ignore = false,
            }, require("telescope.builtin").live_grep, true)
          end,
          "Find words",
        },
        W = {
          function()
            require("utils.telescope").dir_picker({
              show_preview = true,
              hidden = true,
              no_ignore = true,
              no_ignore_parent = true,
              additional_args = function(args)
                return vim.list_extend(args, { "--hidden", "--no-ignore" })
              end,
            }, require("telescope.builtin").live_grep, true)
          end,
          "Find words in all files",
        },
        j = {
          function()
            require("telescope.builtin").jumplist()
          end,
          "Jumplist",
        },
        n = {
          function()
            require("noice").cmd("telescope")
          end,
          "Message history",
        },
        m = {
          function()
            require("telescope.builtin").man_pages()
          end,
          "Find man pages",
        },
        s = {
          function()
            require("telescope.builtin").grep_string()
          end,
          "Find word under cursor",
        },
        o = {
          function()
            require("telescope.builtin").oldfiles()
          end,
          "Find recently opened files",
        },
        h = {
          function()
            require("telescope.builtin").marks()
          end,
          "Find marks",
        },
        ["<CR>"] = {
          function()
            require("telescope.builtin").resume()
          end,
          "Resume last search",
        },
      },
      ["<space>"] = {
        function()
          require("telescope.builtin").marks()
        end,
        "Find marks",
      },
      ["/"] = {
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            previewer = false,
          }))
        end,
        "Fuzzily search in current buffer",
      },
    }, { prefix = "<leader>" })

    local handlers = {
      ["textDocument/declaration"] = require("utils.telescope").location_handler("LSP Declarations"),
      ["textDocument/definition"] = require("utils.telescope").location_handler("LSP Definitions"),
      ["textDocument/implementation"] = require("utils.telescope").location_handler("LSP Implementations"),
      ["textDocument/typeDefinition"] = require("utils.telescope").location_handler("LSP Type Definitions"),
      ["textDocument/references"] = require("utils.telescope").location_handler("LSP References"),
    }

    for req, handler in pairs(handlers) do
      vim.lsp.handlers[req] = handler
    end

    local actions = require("telescope.actions")

    opts.defaults = {
      mappings = {
        i = {
          ["<S-Tab>"] = actions.move_selection_next,
          ["<Tab>"] = actions.move_selection_previous,
        },
        n = {
          ["<S-Tab>"] = actions.move_selection_next,
          ["<Tab>"] = actions.move_selection_previous,
        },
      },
      prompt_prefix = string.format("%s ", " "),
      selection_caret = string.format("%s ", "❯"),
      path_display = { "truncate" },
      file_ignore_patterns = {
        "node_modules/",
        ".git/",
      },
    }

    return opts
  end,
}
