return
{
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          height = 0.9,
          width = 0.8,
          preview_cutoff = 0,
          prompt_position = "top",
        },
        path_display = {
          shorten = 3,
        },
      },
    }
  end
}
