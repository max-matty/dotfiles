require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "markdown",
    "markdown_inline",
    -- "json",
    -- "javascript",
    -- "yaml",
    "html",
    -- "css",
    "bash",
    "lua",
    "python",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
