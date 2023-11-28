
return {

  'ellisonleao/gruvbox.nvim',

  lazy = false,
  priority = 1000,
  --  enabled = false,

  config = function ()
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd("colorscheme gruvbox")
  end

}

