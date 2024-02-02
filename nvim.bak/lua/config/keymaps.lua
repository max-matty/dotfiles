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
vim.keymap.set("n", "<BS>", ":edit #<cr>", opts) -- previous buffer
vim.keymap.set("n", "<Tab>", "<Esc>/](<cr>", opts) -- next link in buffer
vim.keymap.set("n", "<S-Tab>", "<Esc>?](<cr>", opts) -- previous link in buffer
vim.keymap.set("i", "<Esc><Esc>", "<Esc>i.md<Esc>", opts) -- add .md at point

-- spell check
vim.keymap.set("n", "<F4>", ":setlocal spell! spelllang=en_us<cr>", opts)
vim.keymap.set("n", "<F5>", ":setlocal spell! spelllang=it<cr>", opts)
vim.keymap.set("n", "sp", "[s", opts) -- previous misspelling
vim.keymap.set("n", "sn", "]s", opts) -- next misspelling
vim.keymap.set("n", "ss", "1z=", opts) -- show suggestions
vim.keymap.set("n", "sa", "zg", opts) -- add good word
vim.keymap.set("i", "<F4>", "<C-o>:setlocal spell! spelllang=en_us<cr>", opts)
vim.keymap.set("i", "<F5>", "<C-o>:setlocal spell! spelllang=it<cr>", opts)
