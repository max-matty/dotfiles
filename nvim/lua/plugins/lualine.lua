return {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				section_separatos = "",
				components_separators = "",
				disabled_filetypes = {
					-- statusline = {'NvimTree'},
					winbar = { "NvimTree" },
				},
			},
			winbar = {
				lualine_a = { "buffers" },
				--    lualine_z = {"%f %m"},
			},
			extensions = { "nvim-tree" },
		})
	end,
}
