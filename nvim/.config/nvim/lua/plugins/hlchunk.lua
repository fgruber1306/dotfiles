-- hlchunk.lua

return {
  "shellRaining/hlchunk.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {
    chunk = {
      enable = true,
      style = "#f4dbd6",
      chars = {
        right_arrow = "─",
      },
      duration = 150,
      delay = 200,
    },
    indent = {
      enable = true,
      chars = { "┊" },
      style = {
        "#ed8796",
        "#eed49f",
        "#8aadf4",
        "#f5a97f",
        "#a6da95",
        "#c6a0f6",
        "#8bd5ca",
      },
    },
    line_num = {
      enable = true,
      style = "#f4dbd6",
      use_treesitter = true,
    },
  },
}
