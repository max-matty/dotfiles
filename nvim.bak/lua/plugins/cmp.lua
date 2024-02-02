return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- ultisnips config
    "SirVer/ultisnips",
    "quangnguyen30192/cmp-nvim-ultisnips",
    --		"honza/vim-snippets",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "dmitmel/cmp-cmdline-history",
    "onsails/lspkind.nvim",
    "f3fora/cmp-spell",
  },

  config = function()

    -- require('lspkind').init({
    --   -- DEPRECATED (use mode instead): enables text annotations
    --   --
    --   -- default: true
    --   -- with_text = true,
    --
    --   -- defines how annotations are shown
    --   -- default: symbol
    --   -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    --   mode = 'symbol_text',
    --
    --   -- default symbol map
    --   -- can be either 'default' (requires nerd-fonts font) or
    --   -- 'codicons' for codicon preset (requires vscode-codicons font)
    --   --
    --   -- default: 'default'
    --   preset = 'codicons',
    --
    --   -- override preset symbols
    --   --
    --   -- default: {}
    --   symbol_map = {
    --     Text = "󰉿",
    --     Method = "󰆧",
    --     Function = "󰊕",
    --     Constructor = "",
    --     Field = "󰜢",
    --     Variable = "󰀫",
    --     Class = "󰠱",
    --     Interface = "",
    --     Module = "",
    --     Property = "󰜢",
    --     Unit = "󰑭",
    --     Value = "󰎠",
    --     Enum = "",
    --     Keyword = "󰌋",
    --     Snippet = "",
    --     Color = "󰏘",
    --     File = "󰈙",
    --     Reference = "󰈇",
    --     Folder = "󰉋",
    --     EnumMember = "",
    --     Constant = "󰏿",
    --     Struct = "󰙅",
    --     Event = "",
    --     Operator = "󰆕",
    --     TypeParameter = "",
    --   },
    -- })


    local cmp = require("cmp")
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
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
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

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        -- { name = "luasnip", keyword_lenght = 1 },
      }, {
          { name = "buffer" },
          { name = "path" },
          {
            name = "spell",
            option =
              {
                keep_all_entries = false,
                enable_in_context = function()
                  return true
                end,
              },
          },
        }),

      -- configure lspkind for vs-code like icons
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          -- before = function (entry, vim_item)
          --   ...
          --   return vim_item
          -- end
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
