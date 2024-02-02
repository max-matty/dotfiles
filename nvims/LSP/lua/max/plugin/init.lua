return {
  { "RRethy/vim-illuminate", },
  { "simnalamburt/vim-mundo", },
  { "wellle/tmux-complete.vim", },
  { "christoomey/vim-tmux-navigator", },
  { "dhruvasagar/vim-table-mode" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "numToStr/Comment.nvim",
    config = true -- require("Comment").setup()

  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    "folke/neodev.nvim",
    config = true,
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}
