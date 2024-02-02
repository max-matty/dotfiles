return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local function spell()
			if vim.wo.spell == true then
				return "[" .. vim.bo.spelllang .. "]"
			end
			return ""
		end

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
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { spell, "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			winbar = {
				lualine_a = { "buffers" },
				--    lualine_z = {"%f %m"},
			},
			extensions = { "nvim-tree" },
		})
	end,
}
