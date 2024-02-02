
-- vim.lsp.set_log_level('debug')

-- Keymapping
vim.keymap.set("n", " e", ":Ex<cr>", { silent = true, noremap = true })
vim.keymap.set("n", " o", ":Ex /home/max/shared/Workspace/Obsidian<cr>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true, noremap = true })
vim.keymap.set("n", "<Tab>", "/[[<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<S-Tab>", "?[[<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-q>", ":nohlsearch<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-c>", ":bdelete!<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-t>", "gg|:read /home/max/shared/Workspace/Obsidian/templates/tmp<cr><Esc>ggddA", { silent = true, noremap = true })

-- Options
vim.opt.clipboard:append("unnamedplus")
vim.opt.signcolumn = 'yes'
vim.g.netrw_keepdir = 0

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd([[colorscheme darkblue]])
