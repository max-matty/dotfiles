
-- set python command path
vim.g.python3_host_prog = '/usr/bin/python3'

-- export note on savebuffer
vim.api.nvim_create_autocmd( { "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/notes/buildnote %:p ]],
 })

-- set mapleader key
vim.g.mapleader = ' '

-- change links from '/link' to '.link'
vim.cmd("set includeexpr=substitute(v:fname,'/','','')")

-- add 'shared' directory to pah
vim.cmd("set path+=/home/max/shared/**")

-- paste from OS
vim.opt.clipboard:append { "unnamedplus" }

-- forget arrow keys
vim.keymap.set('!', '<Up>', '<Nop>')
vim.keymap.set('!', '<Down>', '<Nop>')
vim.keymap.set('!', '<Left>', '<Nop>')
vim.keymap.set('!', '<Right>', '<Nop>')

-- keymap for personal wiki index
vim.keymap.set('n', '<leader>ww', '<cmd>edit /home/max/shared/Wiki/index.md<cr>')

-- set noswapfile
vim.opt.swapfile = false

-- save uno-tree in files
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/undo')
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000
vim.opt.scrolloff = 5

-- set line number
vim.opt.number = true

-- set conceallevel
vim.opt.conceallevel = 2

-- autoindent and tab space
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- install plugin manager 'folke/lazy.nvim'
-- ===============================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
-- ===============================================

-- plugin config
-- ===============================================

-- 'gruvbox'
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")

-- ALE
vim.g.ale_use_neovim_diagnostics_api = 1

-- 'lspconfig' and 'cmp' completion
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')
-- Enable some language servers
  lspconfig.marksman.setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities, }
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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}
