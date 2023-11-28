
return {

  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },

  config = function()
    local opts = {
      extensions = {
        undo = {
          diff_context_lines = 2,
          use_delta = true,
          side_by_side = true,
          layout_strategy = "horizontal",
          layout_config = {
            --- height = 0.8,
            width = 0.85,
            preview_width = 0.8,
          },
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").restore
            },
          },
        },
      },
    }
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
    -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  end,

}

