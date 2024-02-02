-- Comments for neovim-qt
vim.api.nvim_set_keymap("n", "<C-s-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-s-_>", "gc", { noremap = false })

-- Comments for neovim terminal
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { noremap = false })

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })
