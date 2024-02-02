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
      shorten = 1,
    },
    -- file_ignore_patterns = {
    --   "^shared/Music",
    --   "debian-max",
    --   "public_html",
    -- },
  },
}
