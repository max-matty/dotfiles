return {
  'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip', },

    config = function()
      -- configure LSP
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        vim.keymap.set('n', '<C-p>', function() vim.diagnostic.goto_prev() end, {buffer = bufnr})
        vim.keymap.set('n', '<C-n>', function() vim.diagnostic.goto_next() end, {buffer = bufnr})
      end)

      -- here you can setup the language servers
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'marksman' },
        handlers = {
          lsp_zero.default_setup,

          -- marksman server
          marksman = function()
            require('lspconfig').marksman.setup({
              on_attach = function(client, bufnr)
              print('Hello Markdown')
              require("which-key").register({
                m = {
                  name = "Markdown",
                  h = { ":vimgrep /^# / %<cr> | <cmd>copen<cr>", "H1" },
                  j = { ":vimgrep /^# \\|^## / %<cr> | <cmd>copen<cr>", "H1|H2" },
                  k = { ":vimgrep /^# \\|^## \\|^### / %<cr> | <cmd>copen<cr>", "H1|H2|H3" },
                  a = { function() vim.lsp.buf.code_action() end, "Toc" },
                  d = { function() vim.lsp.buf.definition() end, "Follow link" },
                  f = { function() vim.diagnostic.open_float() end, "Diagnostic show under cursor" },
                  K = { function() vim.lsp.buf.hover() end, "Show link" },
                  r = { function() vim.lsp.buf.rename() end, "Rename Headline" },
                  R = { function() vim.lsp.buf.references() end, "List Tags/Headline under cursor" },
                  w = { function() vim.lsp.buf.workspace_symbol() end, "Grep Tags/Headlines" },
                }
              }, { prefix = "<leader>", buffer = bufnr, noremap = true })
            end,
            })
          end,
        },
      })
    end,
  }
