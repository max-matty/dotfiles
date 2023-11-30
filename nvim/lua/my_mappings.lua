
---------------------------------------------------
-- setting keymapping
---------------------------------------------------

-- insert .md links at point
-- useful to insert links in .md files to .md files
vim.keymap.set('i', '<Esc><Esc>', '<Esc>i.md<Esc>', { noremap = true })

-- forget arrow keys
vim.keymap.set('!', '<Up>', '<Nop>')
vim.keymap.set('!', '<Down>', '<Nop>')
vim.keymap.set('!', '<Left>', '<Nop>')
vim.keymap.set('!', '<Right>', '<Nop>')

-- open previous buffer with BackSpace
vim.keymap.set('n', '<BS>', '<cmd>bprevious<cr>')

-- go to previous and next link with TAB amd Shift-TAB
vim.keymap.set ('n', '<Tab>', '<Esc>/](<cr>')
vim.keymap.set ('n', '<S-Tab>', '<Esc>?](<cr>')

-- nnn integration
vim.keymap.set('n', '<leader>e', '<cmd>NnnExplorer<cr>')
vim.keymap.set('n', '<leader>ee', '<cmd>NnnPicker<cr>')

