-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
