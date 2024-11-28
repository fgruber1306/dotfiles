return {
  "f-person/git-blame.nvim",
  keys = {
    { "<leader>Go", mode = "n", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open commit url" },
    { "<leader>Gh", mode = "n", "<cmd>GitBlameCopySHA<cr>", desc = "Copy commit SHA" },
    { "<leader>Gu", mode = "n", "<cmd>GitBlameCopyCommitURL<cr>", desc = "Copy commit url" },
    { "<leader>Gf", mode = "n", "<cmd>GitBlameOpenFileURL<cr>", desc = "Open file url" },
  },
}
