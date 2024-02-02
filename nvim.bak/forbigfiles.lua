vim.cmd("colorscheme torte")

-- export note on savebuffer
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*-note.md" },
	command = [[ !/home/max/shared/Workspace/Zk/Notes/buildnote %:p ]],
})

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.linebreak = true
-- opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.relativenumber = true
opt.number = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 6
opt.completeopt = "menuone,noinsert,noselect"
opt.conceallevel = 0

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.config/nvim/undo")
opt.undolevels = 10000
opt.undoreload = 10000
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"
opt.showmode = false
opt.history = 10000 -- set cmdline history
