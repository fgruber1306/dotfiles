for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<tab>", false },
      { "<s-tab>", false },
      {
        "<C-l>",
        function()
          require("luasnip").jump(1)
        end,
        mode = { "i", "s" },
      },
      {
        "<C-h>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Remove default mappings by setting opts.mapping to an empty table
      opts.mapping = {}

      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-p>"] = cmp.mapping.scroll_docs(-4),
        ["<C-n>"] = cmp.mapping.scroll_docs(4),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-l>"] = LazyVim.cmp.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
    end,
  },
}
