-- KEYMAP SETTINGS
-- ---------------------------------
local opts = { noremap = true, silent = true }

-- Map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Diagnostics
vim.keymap.set("n", "<C-n>", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "<C-p>", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<C-f>", function() vim.diagnostic.open_float() end, opts)

-- Indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)


-- OPTIONS and FUNCTIONS
-- ---------------------------------

vim.opt.clipboard:append("unnamedplus")

-- Tab / Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Appearance
vim.opt.linebreak = true
vim.opt.foldenable = false
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.scrolloff = 2
vim.opt.conceallevel = 0
vim.opt.cursorline = true

-- for which-key plugin
vim.opt.timeout = true
vim.opt.timeoutlen = 200

-- Behaviour
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false

-- UndoTree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.config/nvim/undo")
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- always highlight yank text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- export note on savebuffer
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*-note.md" },
  command = [[ !/home/max/shared/zk/notes/buildnote %:p ]],
})


-- PLUGINS
-- ---------------------------------

-- install Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require("lazy").setup({
  {
    'bluz71/vim-nightfly-guicolors',
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
  },
  { 'folke/which-key.nvim', event = 'VeryLazy', config = true },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
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
            shorten = 1,
          },
        },
      }
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local lsp_zero = require('lsp-zero')

--      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
--        lsp_zero.default_keymaps({
--          buffer = bufnr,
--          preserve_mappings = false
--        })
--      end)

      -- here you can setup the language servers
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'marksman' },
        handlers = {
--          lsp_zero.default_setup,

          -- marksman server
          marksman = function()
            require('lspconfig').marksman.setup({
              single_file_support = false,
              on_attach = function(client, bufnr)
                print('Welcome to Marksman LSP server')
                require("which-key").register({
                  m = {
                    name = "Marksman",
                    g = { function() vim.lsp.buf.definition() end, "go to definition" },
                    K = { function() vim.lsp.buf.hover() end, "show definition" },
                    q = { function() vim.lsp.buf.workspace_symbol() end, "query workspace" },
                    a = { function() vim.lsp.buf.code_action() end, "code actions" },
                    r = { function() vim.lsp.buf.references() end, "show references" },
                    R = { function() vim.lsp.buf.rename() end, "rename definition" },
                  },
                }, { prefix = "<leader>", buffer = bufnr, noremap = false })
              end,
            })
          end,
        },
      })
    end,
  },
}, {
  install = {
    colorscheme = { "nightfly" },
  },
  rtp = {
    disabled_plugins = {
      "netrw",
      "netrwPlugin",
    },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- setup which-key
-- require('which-key').setup()
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
    s = { ":Telescope find_files<cr>", "In working directory" },
    S = { ":lua require('telescope.builtin').find_files({ cwd = '/home/max/', })<cr>", "In home directory" },
    t = { ":Telescope builtin<cr>", "Choose Telescope" },
  },
  t = {
    name = "Terminal/Lazy",
    g = { ":terminal lazygit<cr>A", "Lazygit" },
    t = { ":terminal<cr>A", "Terminal" },
  },
}, { prefix = "<leader>", noremap = true, silent = true })
