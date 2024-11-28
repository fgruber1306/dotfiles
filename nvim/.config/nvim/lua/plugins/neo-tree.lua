return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>E", false },
      { "<leader>ge", false },
      { "<leader>be", false },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
    },
    opts = {
      close_if_last_window = true,
      enable_diagnostics = true,
      sources = { "filesystem" },
      auto_clean_after_session_restore = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".DS_Store",
          },
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
    },
  },
}
