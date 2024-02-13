-- oil.lua

return {
  "stevearc/oil.nvim",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = false,
    float = {
      max_width = 120,
      max_height = 25,
    },
    view_options = {
      show_hidden = true,
    },
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end,
  },
}
