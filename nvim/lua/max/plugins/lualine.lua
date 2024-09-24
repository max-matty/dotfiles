return
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
--    local function spell()
--      if vim.wo.spell == true then
--        return "[" .. vim.bo.spelllang .. "]"
--      end
--      return ""
--    end
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    lualine.setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { 'NvimTree' },
          winbar = { "NvimTree" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
--          { spell },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      winbar = {
        lualine_a = {
          function()
            return require('do').view('active')
          end,
        },
      },
      -- inactive_winbar = {
      --   -- in order to prevent jumping of code in certain cursor positions this will
      --   -- (at the moment) show an empty line - but only if .view has contents.
      --   lualine_a = { require("do").view_inactive },
      -- },
    })
  end
}
