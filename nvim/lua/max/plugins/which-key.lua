return
{
  'folke/which-key.nvim', event = 'VeryLazy',
  config = function()
    require("which-key").register({
      r = { function() require("ranger-nvim").open(true) end, "Ranger" },
      s = { ":w<cr>", "Save buffer" },
      q = { ":q<cr>", "Quit" },
      b = {
        name = "Buffer operations",
        b = { ":edit #<cr>", "Switch other buffer" },
        d = { ":bdelete<cr>", "Delete buffer" },
        D = { ":bdelete!<cr>", "Delete! buffer" },
        l = { ":buffers<cr>", "List buffers" },
        n = { ":bnext<cr>", "Next buffer" },
        p = { ":bprevious<cr>", "Previous buffer" },
      },
      -- l = {
      --   name = "LPS",
      --   d = { function() vim.diagnostic.open_float() end, "open float diagnostic" },
      --   n = { function() vim.diagnostic.goto_next() end, "next diagnostic" },
      --   p = { function() vim.diagnostic.goto_prev() end, "previous diagnostics" },
      --   t = { function() require('trouble').toggle() end, "trouble toggle" },
      -- },
      e = {
        name = "Explore files...",
        e = { ":NvimTreeToggle<cr>", "Toggle" },
        f = { ":NvimTreeFindFile<cr>", "FindFile" },
        c = { ":NvimTreeCollapse<cr>", "Collapse" },
        -- n = { ":NnnPicker<cr>", "Nnn" },
        r = { ":NvimTreeRefresh<cr>", "Refresh" },
        -- ["<space>"] = { function() require("ranger-nvim").open(true) end, "Ranger" },
      },
      f = {
        name = "Find with Telescope",
        -- B = { ":Telescope buffers<cr>", "Buffers" },
        b = { ":Telescope builtin<cr>", "Choose Telescope" },
        c = { ":Telescope current_buffer_fuzzy_find<cr>", "In current buffer" },
        g = { ":Telescope live_grep<cr>", "Grep recursively" },
        h = { ":lua require('telescope.builtin').find_files({cwd='/home/max/'})<cr>", "Files from home dir" },
        m = { ":Telescope marks<cr>", "Marks" },
        r = { ":Telescope oldfiles<cr>", "Recent files" },
        s = { ":Telescope find_files<cr>", "Files from working dir" },
        t = { ":Telescope help_tags<cr>", "Helps" },
        z = { ":lua require('telescope.builtin').live_grep({cwd='/home/max/shared/zk/zk/'})<cr>", "Grep Zkk" },
      },
      m = {
        name = "Markdown",
        G = { "<cmd>Glow<cr>", "Glow Rendering" },
      },
      t = {
        name = "Terminal/TableMode",
        c = { ":terminal khal interactive<cr>A", "Calendar" },
        s = { ":terminal vdirsyncer sync<cr>A", "CalendarSync" },
        l = { ":terminal khal list<cr>A", "CalendarList" },
        g = { ":terminal lazygit<cr>A", "Lazygit" },
        i = { ":Tableize<cr>", "Tableize(|)" },
        m = { ":TableModeToggle<cr>", "TableModeToggle" },
        r = { ":TableModeRealign<cr>", "TableRealign" },
        t = { ":terminal<cr>A", "Terminal" },
      },
      z = {
        name = "ZenMode",
        t = { ":Twilight<cr>", "Twilight Toggle" },
        z = { ":ZenMode<cr>", "ZenMode Toggle" },
      },
    }, { prefix = "<leader>", noremap = true, silent = true })
  end
}
