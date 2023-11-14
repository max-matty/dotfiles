
---------------------------------------------------
-- setting options
---------------------------------------------------
vim.g.python3_host_prog = '/usr/bin/python3'               -- set python command path
vim.g.mapleader = ' '                                      -- set mapleader key
vim.opt.clipboard:append { "unnamedplus" }                 -- paste from OS
vim.opt.swapfile = false                                   -- set noswapfile
vim.opt.undofile = true                                    -- save undo-tree in files
vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/undo') -- save undo-tree in files
vim.opt.undolevels = 10000                                 -- save undo-tree in files
vim.opt.undoreload = 10000                                 -- save undo-tree in files
vim.opt.scrolloff = 5                                      -- scroll not more then 5 lines from bottom
vim.cmd("set includeexpr=substitute(v:fname,'/','','')")   -- change links from '/link' to '.link'
vim.cmd("set path+=/home/max/shared/**")                   -- add 'shared' directory to pah
vim.opt.number = true                                      -- set line number
vim.opt.conceallevel = 2                                   -- set conceallevel
vim.opt.autoindent = true                                  -- autoindent and tab space
vim.opt.expandtab = true                                   -- autoindent and tab space
vim.opt.tabstop = 2                                        -- autoindent and tab space
vim.opt.softtabstop = 2                                    -- autoindent and tab space
vim.opt.shiftwidth = 2                                     -- autoindent and tab space
vim.opt.history = 10000                                    -- set cmdline history
vim.opt.termguicolors = true                               -- set term gui colors


---------------------------------------------------
-- setting keymapping
---------------------------------------------------
vim.keymap.set('!', '<Up>', '<Nop>')                       -- forget arrow keys
vim.keymap.set('!', '<Down>', '<Nop>')                     -- forget arrow keys
vim.keymap.set('!', '<Left>', '<Nop>')                     -- forget arrow keys
vim.keymap.set('!', '<Right>', '<Nop>')                    -- forget arrow keys
-- keymap for personal wiki index
vim.keymap.set('n', '<leader>ww', '<cmd>edit /home/max/shared/wiki_index.md<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>NnnExplorer<cr>')
vim.keymap.set('n', '<leader>ee', '<cmd>NnnPicker<cr>')


---------------------------------------------------
-- export note on savebuffer
---------------------------------------------------
vim.api.nvim_create_autocmd( { "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/shared/Workspace/Notes/buildnote %:p ]],
})


---------------------------------------------------
-- install plugin manager 'folke/lazy.nvim'
---------------------------------------------------
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


---------------------------------------------------
-- plugin configurations
---------------------------------------------------


-- 'devicons'
---------------------------------------------------
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}


-- 'gruvbox'
---------------------------------------------------
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")


-- ALE
---------------------------------------------------
vim.g.ale_use_neovim_diagnostics_api = 1


-- nnn
require("nnn").setup()


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
    { name = 'buffer' },
    { name = 'path' },
    { name = 'orgmode' },
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

