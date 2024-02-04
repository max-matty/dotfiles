-- PLUGIN MANAGER
-- ---------------------------------

-- install Lazy plugin manager
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

local opts =
{
  install =
  {
    colorscheme = { "tokyonight-night" },
  },
  rtp =
  {
    disabled_plugins = {
      "netrw",
      "netrwPlugin",
    },
  },
  checker =
  {
    enabled = true,
    notify = false,
  },
  change_detection =
  {
    notify = false,
  },
}

-- install plugins
require("lazy").setup('max.plugins', opts)
