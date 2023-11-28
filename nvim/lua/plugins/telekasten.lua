
return {

  'renerocksai/telekasten.nvim',
  dependencies = {'nvim-telescope/telescope.nvim'},
  enabled = false,

  config = function()
    require('telekasten').setup({
      home = vim.fn.expand("/home/max/shared/Workspace/Zibaldo"),
      take_over_my_home = true,
      dailies      = "/home/max/shared/Workspace/Zibaldo/daily",
      weeklies     = "/home/max/shared/Workspace/Zibaldo/weekly",
      templates    = "/home/max/shared/Workspace/Zibaldo/templates",
      image_subdir = "/home/max/shared/Workspace/Zibaldo/img",
      extension    = ".md",
      template_new_note   = "/home/max/shared/Workspace/Zibaldo/templates/new_note.md",
      template_new_daily  = "/home/max/shared/Workspace/Zibaldo/templates/daily.md",
      template_new_weekly = "/home/max/shared/Workspace/Zibaldo/templates/weekly.md",
      image_link_style = "markdown",
--      tag_notation = "#tag",
      tag_notation = "yaml-bare",
      command_palette_theme = "ivy",
      show_tags_theme = "ivy",
      subdirs_in_links = true,
      rename_update_links = true,
  })
  end

}

