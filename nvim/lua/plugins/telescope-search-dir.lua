
return {

  'smilovanovic/telescope-search-dir-picker.nvim',
  --  enabled = false,

  config = function()
    require('telescope').load_extension('search_dir_picker')
  end,

}

