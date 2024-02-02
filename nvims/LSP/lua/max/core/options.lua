vim.opt.clipboard:append("unnamedplus")
vim.g.table_mode_disable_mappings = 1
vim.g.table_mode_syntax = 0
vim.g.mundo_playback_delay = 2000

-- Tab / Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1"

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Appearance
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.scrolloff = 2
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.foldenable = false

-- Behaviour
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.config/nvims/LSP/undo")
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- change pwd to current buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = [[ silent! lcd %:p:h ]],
})

-- close nvim-tree on exit
vim.api.nvim_create_autocmd({ "QuitPre" }, {
  callback = function() vim.cmd("NvimTreeClose") end,
})
