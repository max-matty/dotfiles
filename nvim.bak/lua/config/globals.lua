-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
