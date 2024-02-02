-- SET COLORSCHEME
-- ---------------------------------
vim.cmd([[colorscheme torte]])


-- KEYMAP SETTINGS
-- ---------------------------------
local optsK = { noremap = true, silent = true }
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Indenting
vim.keymap.set("v", "<", "<gv", optsK)
vim.keymap.set("v", ">", ">gv", optsK)
-- Show Explore
vim.keymap.set("n", "<C-l>", ":20Lexplore /home/max/shared/Workspace/Obsidian<cr>", optsK)
-- Close window from inside Explore
--vim.keymap.set("n", "<C-c>", ":close<cr>", optsK)
-- Close window from inside .md file
--vim.keymap.set("n", "<C-C>", ":only<cr>", optsK)
-- Read template
--vim.keymap.set("n", "<C-t>", ":read /home/max/shared/Workspace/Obsidian/templates/tmp|:normal ggdd<Esc>A", optsK)



-- OPTIONS
-- ---------------------------------
vim.opt.clipboard:append("unnamedplus")
-- Tab / Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- Appearance
vim.opt.linebreak = true
vim.opt.foldenable = false
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.scrolloff = 2
vim.opt.conceallevel = 0
-- Which-key plugin
vim.opt.timeout = true

-- Behaviour
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
-- UndoTree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.config/nvims/LSP/undo")
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000
-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")


-- INSTALL PLUGIN MANAGER LAZY.VIM
-- ---------------------------------
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


-- INSTALL PLUGINS
-- ---------------------------------
require('lazy').setup({
  { 'folke/trouble.nvim', opts = { icons = false } },
  'simnalamburt/vim-mundo',
  'dhruvasagar/vim-table-mode',
  'folke/twilight.nvim',
  { 'ellisonleao/glow.nvim', config = true,     cmd = 'Glow' },
  { 'folke/zen-mode.nvim',   event = 'VeryLazy' },
  { 'folke/which-key.nvim',  event = 'VeryLazy' },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  'neovim/nvim-lspconfig',
  'creativenull/efmls-configs-nvim',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'nvim-lua/plenary.nvim',
}, {
  checker = { enabled = true, notify = false },
  change_detection = { notify = false }
})


-- SETUP PLUGINS
-- ---------------------------------


-- WHICH-KEY
-- ---------------------------------
require('which-key').setup()
-- which-key mapping with prefix-key
require("which-key").register({
  m = {
    name = "Markdown",
    h = { ":vimgrep /^# / %<cr> | <cmd>copen<cr>", "H1" },
    j = { ":vimgrep /^# \\|^## / %<cr> | <cmd>copen<cr>", "H1|H2" },
    k = { ":vimgrep /^# \\|^## \\|^### / %<cr> | <cmd>copen<cr>", "H1|H2|H3" },
    x = { ":gx<cr>", "Open in default app" },
    v = { ":Glow<cr>", "Glow" },
  },
  t = {
    name = "Terminal/Lazy/TableMode",
    g = { ":terminal lazygit<cr>A", "Lazygit" },
    i = { ":Tableize<cr>", "Tableize(|)" },
    m = { ":TableModeToggle<cr>", "TableModeToggle" },
    r = { ":TableModeRealign<cr>", "TableRealign" },
    t = { ":terminal<cr>A", "Terminal" },
  },
  u = { ":MundoToggle<cr>", "UndoTreeToggle" },
  z = {
    name = "ZenMode",
    t = { ":Twilight<cr>", "Twilight Toggle" },
    z = { ":ZenMode<cr>", "ZenMode Toggle" },
  },
}, { prefix = "<leader>", noremap = true, silent = true })


-- LSP-ZERO
-- ---------------------------------
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gq", ":lua vim.lsp.buf.workspace_symbol()",
    { buffer = bufnr, remap = false, silent = true })
  vim.keymap.set("n", "<C-p>", ":lua vim.diagnostic.goto_prev()",
    { buffer = bufnr, remap = false, silent = true })
  vim.keymap.set("n", "<C-n>", ":lua vim.diagnostic.goto_next()",
    { buffer = bufnr, remap = false, silent = true })
  vim.keymap.set("n", "f", ":lua vim.lsp.buf.format()<cr> <bar> :w<cr>",
    { buffer = bufnr, remap = false, silent = true })
  vim.keymap.set("n", "f", ":lua vim.lsp.buf.format()<cr> <bar> :w<cr>",
    { buffer = bufnr, remap = false, silent = true })
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'marksman', 'efm' },
  handlers = {
    lsp_zero.default_setup,

    -- marksman server
    marksman = function()
      require('lspconfig').marksman.setup({
      })
    end,

    -- efm server for markdown format
    efm = function()
      require('lspconfig').efm.setup({
        filetypes = { "markdown" },
        init_options = { documentFormatting = true, documentRangeFormatting = true },
        settings = { languages = { markdown = { require("efmls-configs.formatters.prettier_d") } }, },
      })
    end,

  },
})
