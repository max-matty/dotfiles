return
{
  { 'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end
  },
  {
    "numToStr/Comment.nvim",
    config = true
  },
  { "dhruvasagar/vim-table-mode" },
  { 
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({
        enable_cmds = true, 
        ui = {
          border = "single",
          height = 1,
          width = 1,
          x = 0.5,
          y = 0.5,
        }
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      filters = {
        git_ignored = false,
        dotfiles = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
  },
  -- {
  -- "luukvbaal/nnn.nvim",
  -- config = true,
  -- },
  -- { "hashino/do.nvim",
  --   config = true,
  -- },
  {	"wellle/tmux-complete.vim", },
  { "christoomey/vim-tmux-navigator", },
  {
    "sbdchd/neoformat",
  },
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ';' -- Recommended to be a single key
  }
  },
  {
	"ellisonleao/glow.nvim",
	config = true,
	cmd = "Glow",
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  --   version = "*",
    config = true
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true
  },
  {
    'folke/zen-mode.nvim',
    dependencies = {
      'folke/twilight.nvim',
    },
    config = function()
      require('zen-mode').setup({
        window = { backdrop = 1 },
        on_open = function(win)
          vim.opt.linebreak = true
          vim.opt.wrap = true
        end,
        on_close = function()
          vim.opt.linebreak = false
          vim.opt.wrap = false
        end,
      })
      require('twilight').setup({})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}
