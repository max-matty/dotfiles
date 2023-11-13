
-- which-key

return {
  
  'folke/which-key.nvim',

  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

     config = function()
 local wk = require("which-key")
     wk.register({
       u = {"<cmd>Telescope undo<cr>", "Telescope undo"},
       m = {
         name = "Markdown Sub Menu", -- optional group name
         h = { "<cmd>vimgrep /^# / %<cr> | <cmd>copen<cr>", "h1 header" },
         j = { "<cmd>vimgrep /^# \\|^## / %<cr> | <cmd>copen<cr>", "h1|h2 header" },
         k = { "<cmd>vimgrep /^# \\|^## \\|^### / %<cr> | <cmd>copen<cr>", "h1|h2|h3 header" },
         t = { "<cmd>Telescope heading<cr>", "Telescope heading" },
         p = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Toggle Preview"},
         o = { "<cmd>Trouble<cr>", "Lint Window Open"},
         c = { "<cmd>TroubleClose<cr>", "Lint Window Close"},
       },
       f = {
         name = "Fzf Searching...", -- optional group name
         s = { "<cmd>Telescope find_files<cr>", "...files in directory recursively" },
         t = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "...files browsing directory trees" },
         g = { "<cmd>Telescope live_grep<cr>", "...strings and files in directory recursively" },
         c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "...strings in current buffer" },
         b = { "<cmd>Telescope buffers<cr>", "...open buffers" },
         r = { "<cmd>Telescope oldfiles<cr>", "...recent files" },
         h = { "<cmd>Telescope help_tags<cr>", "...help tags" },    
         f = { "<cmd>Telescope search_dir_picker<cr>", "...strings and files in pre-selected dir" },    
       },
       g = {"<cmd>Glow<cr>", "Glow Rendering"},
     }, { prefix = '<leader>' })
     end

--  opts = {

--  }

}
