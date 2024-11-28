local gitblame = require("gitblame")

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_x = {
          {
            gitblame.get_current_blame_text,
            cond = gitblame.is_blame_text_available,
          },
        },
      },
    },
  },
}
