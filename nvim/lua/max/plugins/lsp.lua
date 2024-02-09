return
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
    end)
    lsp_zero.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'marksman', 'bashls' },
      handlers = {
        -- marksman server
        marksman = function()
          require('lspconfig').marksman.setup({
            single_file_support = false,
            on_attach = function(client, bufnr)
              require("which-key").register({
                m = {
                  name = "Markdown",
                  f = { function() require('conform').format() end, "formatting" },
                },
              }, { mode = { "n", "v" }, prefix = "<leader>", buffer = bufnr, noremap = false })
              print('Welcome to Marksman LSP server')
              require("which-key").register({
                m = {
                  name = "Markdown",
                  a = { function() vim.lsp.buf.code_action() end, "code actions" },
                  g = { function() vim.lsp.buf.definition() end, "go to definition" },
                  K = { function() vim.lsp.buf.hover() end, "show definition" },
                  q = { function() vim.lsp.buf.workspace_symbol() end, "query workspace" },
                  r = { function() vim.lsp.buf.references() end, "show references" },
                  R = { function() vim.lsp.buf.rename() end, "rename definition" },
                },
              }, { prefix = "<leader>", buffer = bufnr, noremap = false })
            end,
          })
        end,
        -- bash server
        bashls = function()
          require('lspconfig').bashls.setup({
            single_file_support = false,
            on_attach = function(client, bufnr)
              lsp_zero.default_keymaps({buffer = bufnr})
              print('Welcome to Bash LSP server')
            end,
          })
        end,
      },
    })
    -- completion adding buffer and snippet source
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    local cmp_format = require('lsp-zero').cmp_format()
    require('luasnip.loaders.from_vscode').lazy_load()
    cmp.setup({
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      },
      sources = {
        {name = 'nvim_lsp'},
        -- {name = 'buffer'},
        {name = 'path'},
        {name = 'luasnip'},
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      }),
      formatting = cmp_format,
    })
  end
}
