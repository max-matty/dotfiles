
---------------------------------------------------
-- plugin configurations
---------------------------------------------------

-- 'telescope media_files'
---------------------------------------------------
require('telescope').load_extension('media_files')

-- 'gruvbox'
---------------------------------------------------
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")


-- ALE
---------------------------------------------------
vim.g.ale_use_neovim_diagnostics_api = 1


-- nnn
---------------------------------------------------
require("nnn").setup()


---------------------------------------------------
-- 'lspconfig' and 'cmp' completion
---------------------------------------------------

-- enable friendly-snipppets
require('luasnip.loaders.from_vscode').lazy_load()

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- Enable some language servers
  lspconfig.marksman.setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities, }

-- Enable lua language server
require'lspconfig'.lua_ls.setup {}

-- Enable zk language server
require'lspconfig'.zk.setup {}
--require('lspconfig/configs').zk = {
--  default_config = {
--    cmd = {'zk', 'lsp'},
--    filetypes = {'markdown'},
--    root_dir = function()
--      return vim.loop.cwd()
--    end,
--    settings = {}
--  };
--}
--require('lspconfig').zk.setup({ on_attach = function(client, buffer)
--end })

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(), -- close completion window
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
--        zk = "[Zk]",
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
--    { name = 'zk' },
    { name = 'luasnip' },
--    { name = 'mkdnflow' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
--    { name = 'orgmode' },
  },
}

-- setup cmp-cmdline
-- `/` cmdline setup.
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'cmdline_history' }
    })
})
-- `:` cmdline setup.
--cmp.setup.cmdline(':', {
--  sources = {
--    { name = 'cmdline_history' }
--  },
--})

