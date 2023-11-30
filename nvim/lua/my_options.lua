
---------------------------------------------------
-- setting options
---------------------------------------------------

-- setting colorscheme
vim.cmd("colorscheme torte")

-- general options
vim.opt.number = true                                      -- set line number
vim.g.python3_host_prog = '/usr/bin/python3'               -- set python command path
vim.g.mapleader = ' '                                      -- set mapleader key
vim.opt.clipboard:append { "unnamedplus" }                 -- paste from OS
vim.opt.swapfile = false                                   -- set noswapfile
vim.opt.termguicolors = true                               -- set term gui colors
vim.cmd("set path+=/home/max/shared/**")                   -- add 'shared' directory to pah
vim.opt.history = 10000                                    -- set cmdline history

-- undo settings
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/undo')
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- moving and scrolling
vim.opt.scrolloff = 5
vim.opt.conceallevel = 0
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- markdown stuffs
-- change links from '/link' to '.link'
--vim.cmd("set includeexpr=substitute(v:fname,'/','/home/max/shared/Workspace/Zk/','')")
--vim.opt.suffixesadd = '.md'                                -- try adding extension to links

