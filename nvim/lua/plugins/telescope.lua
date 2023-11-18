
-- telescope

return {

  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require('telescope').extensions.media_files()
    require('telescope').setup({
      extensions = {
        filetypes = { "png", "jpg", "jpeg" },
        find_cm = "rg",
      }
    })
  end

}

