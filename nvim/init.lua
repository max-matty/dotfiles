
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
-- change links from '/link' to '.link'
vim.cmd("set includeexpr=substitute(v:fname,'/','/home/max/shared/Workspace/Zettelkasten/','')")
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
vim.opt.hlsearch = false                                   -- set off highligh search pattern


---------------------------------------------------
-- setting keymapping
---------------------------------------------------
vim.keymap.set('!', '<Up>', '<Nop>')                       -- forget arrow keys
vim.keymap.set('!', '<Down>', '<Nop>')                     -- forget arrow keys
vim.keymap.set('!', '<Left>', '<Nop>')                     -- forget arrow keys
vim.keymap.set('!', '<Right>', '<Nop>')                    -- forget arrow keys
-- keymap open previous buffer
vim.keymap.set('n', '<BS>', '<cmd>bprevious<cr>')          -- BackSpace go to previous buffer
-- go to previous and next link
vim.keymap.set ('n', '<Tab>', '<Esc>/](<cr>')              -- TAB go next markdown link
vim.keymap.set ('n', '<S-Tab>', '<Esc>?](<cr>')            -- Shit-TAB go previous markdown link
-- go to link under cursor
vim.keymap.set ('n', '<cr>', '<Esc>gf')                    -- follow link under cursor
-- keymap for personal wiki index
--vim.keymap.set('n', '<leader>ww', "<cmd>edit /home/max/shared/Workspace/Notes/index.md<cr>")
vim.keymap.set('n', '<leader>e', '<cmd>NnnExplorer<cr>')
vim.keymap.set('n', '<leader>ee', '<cmd>NnnPicker<cr>')
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten panel<CR>")
-- Most used functions
--vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
--vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
--vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
--vim.keymap.set("n", "<leader>zF", "<cmd>Telekasten follow_link<CR>")
--vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
--vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
--vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
--vim.keymap.set("n", "<leader>zT", "<cmd>Telekasten show_tags<CR>")
--vim.keymap.set("n", "<leader>zB", "<cmd>Telekasten show_backlinks<CR>")
--vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
--vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten new_templated_note<CR>")
--vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten browse_media<CR>")
--vim.keymap.set("n", "<leader>zp", "<cmd>Telekasten preview_img<CR>")
-- Call insert link automatically when we start typing a link
--vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

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

-- Enable lua language server
--require'lspconfig'.zk.setup {}

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
    { name = 'luasnip' },
    { name = 'mkdnflow' },
    { name = 'nvim_lsp' },
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

