local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Pane and Window Navigation
keymap.set("n", "<C-h>", ":<C-w>h<cr>", opts) -- Navigate Left
keymap.set("n", "<C-j>", ":<C-w>j<cr>", opts) -- Navigate Down
keymap.set("n", "<C-k>", ":<C-w>k<cr>", opts) -- Navigate Up
keymap.set("n", "<C-l>", ":<C-w>l<cr>", opts) -- Navigate Right
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>", opts) -- Navigate Left
keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>", opts) -- Navigate Down
keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>", opts) -- Navigate Up
keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>", opts) -- Navigate Right

-- Indenting
keymap.set("v", "<", "<gv", { silent = true, noremap = true })
keymap.set("v", ">", ">gv", { silent = true, noremap = true })
--
-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { noremap = false })

-- zk related keymaps
vim.keymap.set("n", "<BS>", "<cmd>edit #<cr>") -- previous buffer
vim.keymap.set("n", "<Tab>", "<Esc>/](<cr>") -- next link in buffer
vim.keymap.set("n", "<S-Tab>", "<Esc>?](<cr>") -- previous link in buffer
vim.keymap.set("i", "<Esc><Esc>", "<Esc>i.md<Esc>", { noremap = true }) -- add .md at point
