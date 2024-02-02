-- Comments for neovim-qt
vim.api.nvim_set_keymap("n", "<C-s-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-s-_>", "gc", { noremap = false })

-- Comments for neovim terminal
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { noremap = false })

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Pane and Window Navigation
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", ":<C-w>h<cr>", opts)            -- Navigate Left
vim.keymap.set("n", "<C-j>", ":<C-w>j<cr>", opts)            -- Navigate Down
vim.keymap.set("n", "<C-k>", ":<C-w>k<cr>", opts)            -- Navigate Up
vim.keymap.set("n", "<C-l>", ":<C-w>l<cr>", opts)            -- Navigate Right
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>", opts)  -- Navigate Left
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>", opts)  -- Navigate Down
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>", opts)    -- Navigate Up
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>", opts) -- Navigate Right
