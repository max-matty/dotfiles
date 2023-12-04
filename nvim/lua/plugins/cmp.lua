return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- ultisnips config
		"SirVer/ultisnips",
		"honza/vim-snippets",
		"quangnguyen30192/cmp-nvim-ultisnips",
		--
		-- -- luasnip config
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	-- follow latest release.
		-- 	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- 	-- install jsregexp (optional!).
		-- 	build = "make install_jsregexp",
		-- },
		-- "saadparwaiz1/cmp_luasnip",
		--
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp = require("cmp")

		-- snippet engine
		local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
		-- local luasnip = require("luasnip")
		-- require("luasnip/loaders/from_vscode").lazy_load()

		local lspkind = require("lspkind")

		vim.opt.completeopt = "menu,menuone,noselect"

		-- -- luasnip
		-- local has_words_before = function()
		-- 	unpack = unpack or table.unpack
		-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		-- end

		cmp.setup({

			-- ultisnip
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
				end,
			},

			-- -- luasnip
			-- snippet = {
			-- 	expand = function(args)
			-- 		luasnip.lsp_expand(args.body)
			-- 	end,
			-- },

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
				--
				-- -- luasnip
				-- ["<Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item()
				-- 	elseif luasnip.expand_or_jumpable() then
				-- 		luasnip.expand_or_jump()
				-- 	elseif has_words_before() then
				-- 		cmp.complete()
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	elseif luasnip.jumpable(-1) then
				-- 		luasnip.jump(-1)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
				-- --
			}),

			-- sources = cmp.config.sources({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "ultisnips" },
				-- { name = "luasnip", keyword_lenght = 1 },
				{ name = "buffer" },
				{ name = "path" },
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
				sources = ({
					{ name = "path" },
					{ name = "cmdline_history" },
          {	name = "cmdline" },
						option = {
							ignore_cmds = { "Man", "!" },
						},
				}),
			}),
		})
	end,
}
