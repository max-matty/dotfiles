
vim.g.python3_host_prog = '/usr/bin/python3'

-- export note on savebuffer
vim.api.nvim_create_autocmd( { "BufWritePost" }, {
  pattern = { "*note-*.md" },
  command = [[ !/home/max/notes/buildnote %:p ]],
 })


-- mapleader key
vim.g.mapleader = ' '

-- paste from OS
vim.opt.clipboard:append { "unnamedplus" }

-- forget arrow keys
vim.keymap.set('!', '<Up>', '<Nop>')
vim.keymap.set('!', '<Down>', '<Nop>')
vim.keymap.set('!', '<Left>', '<Nop>')
vim.keymap.set('!', '<Right>', '<Nop>')

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
vim.cmd([[colorscheme gruvbox]])

-- 'which-key.nvim -- quickfix Markdown Headers
 local wk = require("which-key")
     wk.register({
       p = {"<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>", "Markdown Web Preview"},
       u = {"<cmd>Telescope undo<cr>", "Telescope undo"},
       m = {
         name = "Fzf Markdown headers", -- optional group name
         h = { "<cmd>vimgrep /^# / %<cr> | <cmd>copen<cr>", "h1 header" },
         j = { "<cmd>vimgrep /^# \\|^## / %<cr> | <cmd>copen<cr>", "h1|h2 header" },
         k = { "<cmd>vimgrep /^# \\|^## \\|^### / %<cr> | <cmd>copen<cr>", "h1|h2|h3 header" },
       },
       f = {
         name = "Fzf Searching", -- optional group name
         f = { "<cmd>Telescope find_files<cr>", "Files in directory" },
         t = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "Browse trees" },
         g = { "<cmd>Telescope live_grep<cr>", "Strings in directory" },
         c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Strings in buffer" },
         b = { "<cmd>Telescope buffers<cr>", "Buffers" },
         r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
         h = { "<cmd>Telescope help_tags<cr>", "Help" },    
       },
       g = {"<cmd>Glow<cr>", "Glow Rendering"},
     }, { prefix = '<leader>' })

-- 'neoclide/coc.nvim'
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- 'telescope-search-dir-picker.nvim'
require('telescope').load_extension('search_dir_picker')

