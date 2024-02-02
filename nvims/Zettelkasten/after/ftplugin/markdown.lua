
-- after/ftplugin/markdown.lua

local paths = vim.fs.find('.marksman.toml', {
  upward = true,
  stop = vim.uv.os_homedir(),
  path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
})

local root_dir = vim.fs.dirname(paths[1])

-- if root_dir then
if root_dir then
	local client = vim.lsp.start({
		name = 'marksman',
		cmd = {'marksman'},
		filetypes = { 'markdown'},
		root_dir = root_dir,
	})
	vim.lsp.buf_attach_client(0, client)
  local opts = {buffer = 0, remap = false}
  vim.keymap.set("n", " d", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<cr>", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<C-g>", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", " K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", " q", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", " D", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<C-n>", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<C-p>", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", " a", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", " r", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", " R", function() vim.lsp.buf.rename() end, opts)
end
