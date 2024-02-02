return {
	--  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "simnalamburt/vim-mundo" },
	{ "dhruvasagar/vim-table-mode" },
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = true },
	{ "folke/which-key.nvim", event = "VeryLazy", config = true },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { filters = { dotfiles = true } },
	},
}
