-- keymapping with prefix leader key
require("which-key").register({
  b = {
    name = "Buffers",
    b = { ":edit #<cr>", "Switch" },
    d = { ":bdelete<cr>", "Close" },
    D = { ":bdelete!<cr>", "Close!" },
    l = { ":buffers<cr>", "List" },
    n = { ":bnext<cr>", "Next" },
    p = { ":bprevious<cr>", "Previous" },
    q = { ":q<cr>", "Quit" },
    w = { ":w<cr>", "Write" },
    X = { ":wq<cr>", "Save&Exit" },
    x = { ":w|bdelete<cr>", "Save&Close" },
  },
  e = {
    name = "NvimTree",
    e = { ":NvimTreeToggle<cr>", "Toggle" },
    f = { ":NvimTreeFindFile<cr>", "FindFile" },
    c = { ":NvimTreeCollapse<cr>", "Collapse" },
    r = { ":NvimTreeRefresh<cr>", "Refresh" },
  },
  f = {
    name = "Folding",
    f = { "zi", "Toogle" },
    c = { "zM", "CloseAll" },
    o = { "zR", "OpenAll" },
    t = { "za", "ToggleOnCursor" },
  },
  t = {
    name = "Terminal/Lazy/TableMode",
    g = { ":terminal lazygit<cr>A", "Lazygit" },
    i = { ":Tableize<cr>", "Tableize(|)" },
    m = { ":TableModeToggle<cr>", "TableModeToggle" },
    r = { ":TableModeRealign<cr>", "TableRealign" },
    t = { ":terminal<cr>A", "Terminal" },
  },
--[[  s = {
    name = "Telescope search",
    b = { ":Telescope buffers<cr>", "Buffers" },
    c = { ":Telescope current_buffer_fuzzy_find<cr>", "In buffer" },
    f = { ":Telescope search_dir_picker<cr>", "In pre-selected dir" },
    g = { ":Telescope live_grep<cr>", "Grep recursively" },
    h = { ":Telescope help_tags<cr>", "Help" },
    m = { ":Telescope marks<cr>", "Marks" },
    r = { ":Telescope oldfiles<cr>", "Recent files" },
    s = { ":Telescope find_files<cr>", "In working directory" },
    S = { ":lua require('telescope.builtin').find_files({ cwd = '/home/max/', })<cr>", "In home directory" },
    t = { ":Telescope builtin<cr>", "Choose Telescope" },
  }, --]]
  u = { ":MundoToggle<cr>", "UndoTreeToggle" },
--[[  z = {
    name = "ZenMode",
    t = { ":Twilight<cr>", "Twilight Toggle" },
    z = { ":ZenMode<cr>", "ZenMode Toggle" },
  }, --]]
}, { prefix = "<leader>", noremap = true, silent = true })
