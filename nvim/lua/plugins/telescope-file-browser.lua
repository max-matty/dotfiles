
-- telescope-file-browser

return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local opts = {
      extensions = {
        file_browser = {
          layout_strategy = "horizontal",
          layout_config = {
            --- height = 0.8,
            width = 0.85,
            preview_width = 0.5,
          },
        },
      },
    }
    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")
  end,
}


