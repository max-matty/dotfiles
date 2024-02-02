return {
  {
    "bluz71/vim-nightfly-guicolors",
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
}
