
return {

  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  -- or, branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'smilovanovic/telescope-search-dir-picker.nvim',
    'debugloop/telescope-undo.nvim',
--    'crispgm/telescope-heading.nvim',
  },

  config = function()
    require('telescope').setup({
      extensions = {
        file_browser = {
          layout_strategy = "horizontal",
          layout_config = {
            --- height = 0.8,
            width = 0.85,
            preview_width = 0.5,
          },
        },
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "jpg", "jpeg"},
          -- find command (defaults to `fd`)
          find_cmd = "rg"
        },
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
        },
      }
    })
    require("telescope").load_extension("file_browser")
    require('telescope').load_extension('media_files')
    require('telescope').load_extension('search_dir_picker')
    require("telescope").load_extension("undo")
--    require('telescope').load_extension('heading')
  end

}

