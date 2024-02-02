return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	-- enabled = false,

	config = function()
		require("nvim-treesitter.configs").setup({
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"json",
				"javascript",
				"yaml",
				"html",
				"css",
				"bash",
				"lua",
				"gitignore",
				"python",
				"gitcommit",
				"gitignore",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
