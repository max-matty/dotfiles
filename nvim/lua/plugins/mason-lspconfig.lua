return {
	"williamboman/mason-lspconfig.nvim",
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",

	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"efm",
				"lua_ls",
				"marksman",
			},
			automatic_installation = true,
		})
	end,
}
