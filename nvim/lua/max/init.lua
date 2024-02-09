-- KEYMAP SETTINGS
-- ---------------------------------
local opts = { noremap = true, silent = true }

-- Map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Comments for neovim-qt
vim.api.nvim_set_keymap("n", "<C-s-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-s-_>", "gc", { noremap = false })

-- Comments for neovim terminal
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { noremap = false })

-- Diagnostics
vim.keymap.set("n", "<C-n>", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "<C-p>", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<C-f>", function() vim.diagnostic.open_float() end, opts)

-- Indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)


-- OPTIONS and FUNCTIONS
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
vim.opt.scrolloff = 6
vim.opt.conceallevel = 0
vim.opt.cursorline = true

-- for which-key plugin
vim.opt.timeout = true
vim.opt.timeoutlen = 200

-- Behaviour
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false

-- UndoTree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.config/nvim/undo")
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- export note on savebuffer
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/shared/zk/notes/buildnote %:p ]],
})
