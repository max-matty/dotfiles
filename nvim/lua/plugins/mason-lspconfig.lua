return {
	"williamboman/mason-lspconfig.nvim",
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",

	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"efm",
				"lua_ls",
				"zk",
			},
			automatic_installation = true,
		})
	end,
}
