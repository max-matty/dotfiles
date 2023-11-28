
return {

  'crispgm/telescope-heading.nvim',
  enabled = false,

  config = function()
    require('telescope').load_extension('heading')
  end,

}

