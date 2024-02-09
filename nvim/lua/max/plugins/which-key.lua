return
{
  'folke/which-key.nvim', event = 'VeryLazy',
  config = function()
    require("which-key").register({
      b = {
        name = "Buffer Navigation",
        b = { ":edit #<cr>", "Switch other buffer" },
        d = { ":bdelete<cr>", "Delete buffer" },
        D = { ":bdelete!<cr>", "Delete! buffer" },
        l = { ":buffers<cr>", "List buffers" },
        n = { ":bnext<cr>", "Next buffer" },
        p = { ":bprevious<cr>", "Previous buffer" },
      },
      l = {
        name = "LPS",
        d = { function() vim.diagnostic.open_float() end, "open float diagnostic" },
        n = { function() vim.diagnostic.goto_next() end, "next diagnostic" },
        p = { function() vim.diagnostic.goto_prev() end, "previous diagnostics" },
        t = { function() require('trouble').toggle() end, "trouble toggle" },
      },
      e = {
        name = "Explore files...",
        e = { ":NvimTreeToggle<cr>", "Toggle" },
        f = { ":NvimTreeFindFile<cr>", "FindFile" },
        c = { ":NvimTreeCollapse<cr>", "Collapse" },
        r = { ":NvimTreeRefresh<cr>", "Refresh" },
      },
      f = {
        name = "Telescope search",
        b = { ":Telescope buffers<cr>", "Buffers" },
        c = { ":Telescope current_buffer_fuzzy_find<cr>", "In current buffer" },
        g = { ":Telescope live_grep<cr>", "Grep recursively" },
        h = { ":Telescope help_tags<cr>", "Helps" },
        m = { ":Telescope marks<cr>", "Marks" },
        r = { ":Telescope oldfiles<cr>", "Recent files" },
        s = { ":Telescope find_files<cr>", "Files in working directory" },
        S = { ":lua require('telescope.builtin').find_files({cwd='/home/max/'})<cr>", "Files in home directory" },
        t = { ":Telescope builtin<cr>", "Choose Telescope" },
        z = { ":lua require('telescope.builtin').live_grep({cwd='/home/max/shared/zk/'})<cr>", "Grep in zettelksten" },
      },
      t = {
        name = "Terminal/Lazy/TableMode",
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
