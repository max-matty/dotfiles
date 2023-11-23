
---------------------------------------------------
-- export note on savebuffer
---------------------------------------------------
vim.api.nvim_create_autocmd( { "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/shared/Workspace/Notes/buildnote %:p ]],
})

