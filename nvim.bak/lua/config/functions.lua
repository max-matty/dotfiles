-- export note on savebuffer
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/shared/Workspace/Zk/Notes/buildnote %:p ]],
})

-- change pwd to current buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = [[ silent! lcd %:p:h ]],
})
