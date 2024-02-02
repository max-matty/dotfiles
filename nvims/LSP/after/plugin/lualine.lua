local function spell()
  if vim.wo.spell == true then
    return "[" .. vim.bo.spelllang .. "]"
  end
  return ""
end

local lualine = require("lualine")
local lazy_status = require("lazy.status") -- to configure lazy pending updates count

lualine.setup({
  options = {
    theme = "auto",
    -- theme = "16color",
    icons_enabled = true,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    -- components_separators = "",
    -- section_separatos = "",
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
      { spell },
      { "encoding" },
      { "fileformat" },
      { "filetype" },
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  -- winbar = {
  -- lualine_a = { "buffers" },
  --    lualine_z = {"%f %m"},
  -- },
  -- extensions = { "nvim-tree" },
})
