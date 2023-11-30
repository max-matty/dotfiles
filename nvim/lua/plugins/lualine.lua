
return {

	'nvim-lualine/lualine.nvim',
--  enabled = false,

	opts = {
		icons_enabled = true,
		section_separatos = '',
		components_separators = '',
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
      },
    theme = 'auto',
--    winbar = {
--      lualine_a = {"%f %m"},
--    }
	}

}
