-- treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "html",
      "http",
      "ini",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "passwd",
      "php",
      "phpdoc",
      "regex",
      "scss",
      "sql",
      "toml",
      "tsx",
      "vim",
      "vue",
      "xml",
      "yaml",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
