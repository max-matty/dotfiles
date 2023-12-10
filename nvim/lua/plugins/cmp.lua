return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- ultisnips config
		"SirVer/ultisnips",
		"honza/vim-snippets",
		"quangnguyen30192/cmp-nvim-ultisnips",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"onsails/lspkind.nvim",
		"f3fora/cmp-spell",
	},

	config = function()
		local cmp = require("cmp")

		-- snippet engine
		local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

		local lspkind = require("lspkind")

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({

			-- ultisnip
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				-- ultisnips
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						cmp_ultisnips_mappings.jump_backwards(fallback)
					end
				end, { "i", "s" }),
			}),

			-- sources = cmp.config.sources({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "ultisnips" },
				-- { name = "luasnip", keyword_lenght = 1 },
				{ name = "buffer" },
				{ name = "path" },
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				},
			},

			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},

			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path" },
					{ name = "cmdline_history" },
					{ name = "cmdline" },
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
