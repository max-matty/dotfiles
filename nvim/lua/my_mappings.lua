
---------------------------------------------------
-- setting keymapping
---------------------------------------------------
vim.keymap.set('!', '<Up>', '<Nop>')                       -- forget arrow keys
vim.keymap.set('!', '<Down>', '<Nop>')                     -- forget arrow keys
vim.keymap.set('!', '<Left>', '<Nop>')                     -- forget arrow keys
vim.keymap.set('!', '<Right>', '<Nop>')                    -- forget arrow keys
-- keymap open previous buffer
vim.keymap.set('n', '<BS>', '<cmd>bprevious<cr>')          -- BackSpace go to previous buffer
-- go to previous and next link
vim.keymap.set ('n', '<Tab>', '<Esc>/](<cr>')              -- TAB go next markdown link
vim.keymap.set ('n', '<S-Tab>', '<Esc>?](<cr>')            -- Shit-TAB go previous markdown link
-- go to link under cursor
--vim.keymap.set ('n', '<cr>', '<Esc>gf')                    -- follow link under cursor
-- keymap for personal wiki index
--vim.keymap.set('n', '<leader>ww', "<cmd>edit /home/max/shared/Workspace/Notes/index.md<cr>")
vim.keymap.set('n', '<leader>e', '<cmd>NnnExplorer<cr>')
vim.keymap.set('n', '<leader>ee', '<cmd>NnnPicker<cr>')
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten panel<CR>")
-- Most used functions
--vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
--vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
--vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
--vim.keymap.set("n", "<leader>zF", "<cmd>Telekasten follow_link<CR>")
--vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
--vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
--vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
--vim.keymap.set("n", "<leader>zT", "<cmd>Telekasten show_tags<CR>")
--vim.keymap.set("n", "<leader>zB", "<cmd>Telekasten show_backlinks<CR>")
--vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
--vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten new_templated_note<CR>")
--vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten browse_media<CR>")
--vim.keymap.set("n", "<leader>zp", "<cmd>Telekasten preview_img<CR>")
-- Call insert link automatically when we start typing a link
--vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

