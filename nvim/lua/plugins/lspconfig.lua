return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
	},

	config = function()
		require("neoconf").setup({})

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")
		local signs = { Error = " ", Warn = " ", Hint = "󱧤", Info = "" }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- bash
		lspconfig.bashls.setup({
			capabilities = capabilities,
		})

		-- -- marksman
		-- lspconfig.marksman.setup({
		-- 	capabilities = capabilities,
		-- })

		-- zk
		lspconfig.zk.setup({
			capabilities = capabilities,
		})

		local luacheck = require("efmls-configs.linters.luacheck")
		local stylua = require("efmls-configs.formatters.stylua")
		local markdownlint = require("efmls-configs.linters.markdownlint")
		local prettier_d = require("efmls-configs.formatters.prettier_d")
		local shellcheck = require("efmls-configs.linters.shellcheck")
		local shfmt = require("efmls-configs.formatters.shfmt")

		-- configure efm server
		lspconfig.efm.setup({
			filetypes = {
				"lua",
				"markdown",
				"sh",
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
				hover = true,
				documentSymbol = true,
				codeAction = true,
				completion = true,
			},
			settings = {
				languages = {
					lua = { luacheck, stylua },
					markdown = { markdownlint, prettier_d },
					sh = { shellcheck, shfmt },
				},
			},
		})

		-- Format on Save
		local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = lsp_fmt_group,
			callback = function()
				local efm = vim.lsp.get_active_clients({ name = "efm" })

				if vim.tbl_isempty(efm) then
					return
				end

				vim.lsp.buf.format({ name = "efm", async = true })
			end,
		})
	end,
}
