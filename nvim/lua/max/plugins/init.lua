return
{
  { 'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end
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
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = true
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'markdown', 'markdown_inline' },
        highlight = { enable = true },
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    'folke/zen-mode.nvim',
    dependencies = {
      'folke/twilight.nvim',
    },
    config = function()
      require('zen-mode').setup({
        window = { backdrop = 1 },
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
