return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"smilovanovic/telescope-search-dir-picker.nvim",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},

	config = function()
		require("telescope").setup({
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
					filetypes = { "png", "jpg", "jpeg" },
					find_cmd = "rg",
				},
				undo = {
					diff_context_lines = 2,
					use_delta = true,
					side_by_side = false,
					layout_strategy = "horizontal",
					layout_config = {
						--- height = 0.8,
						width = 0.85,
						preview_width = 0.8,
					},
				},
			},
		})
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("search_dir_picker")
		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("undo")
		require("telescope").setup({
			extensions = {
				undo = {
					mappings = {
						i = {
							["<C-Y>"] = require("telescope-undo.actions").yank_additions,
							["<C-y>"] = require("telescope-undo.actions").yank_deletions,
							["<C-r>"] = require("telescope-undo.actions").restore,
						},
						n = {
							["Y"] = require("telescope-undo.actions").yank_additions,
							["y"] = require("telescope-undo.actions").yank_deletions,
							["r"] = require("telescope-undo.actions").restore,
						},
					},
				},
			},
		})
	end,
}
