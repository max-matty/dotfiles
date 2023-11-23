
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
vim.cmd("set includeexpr=substitute(v:fname,'/','/home/max/shared/Workspace/Zk/','')")
vim.cmd("set path+=/home/max/shared/**")                   -- add 'shared' directory to pah
vim.opt.number = true                                      -- set line number
vim.opt.conceallevel = 0                                   -- set conceallevel
vim.opt.autoindent = true                                  -- autoindent and tab space
vim.opt.expandtab = true                                   -- autoindent and tab space
vim.opt.tabstop = 2                                        -- autoindent and tab space
vim.opt.softtabstop = 2                                    -- autoindent and tab space
vim.opt.shiftwidth = 2                                     -- autoindent and tab space
vim.opt.history = 10000                                    -- set cmdline history
vim.opt.termguicolors = true                               -- set term gui colors
vim.opt.hlsearch = false                                   -- set off highligh search pattern

