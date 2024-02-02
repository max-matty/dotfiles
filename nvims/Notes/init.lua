-- Options
vim.opt.clipboard:append("unnamedplus")
vim.opt.signcolumn = 'yes'
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd([[colorscheme darkblue]])

-- export note on savebuffer
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/shared/Workspace/Zk/Notes/buildnote %:p ]],
})

-- install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
})
