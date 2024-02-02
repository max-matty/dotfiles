local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'bashls',
  'clangd',
  'lua_ls',
  'marksman',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  require("which-key").register({
    v = {
      name = "Diagnostic",
      a = { function() vim.lsp.buf.code_action() end, "code_action" },
      d = { function() vim.lsp.buf.definition() end, "definition" },
      f = { function() vim.diagnostic.open_float() end, "open_float" },
      K = { function() vim.lsp.buf.hover() end, "search_hover" },
      p = { function() vim.diagnostic.goto_prev() end, "previous" },
      n = { function() vim.diagnostic.goto_next() end, "next" },
      r = { function() vim.lsp.buf.rename() end, "rename" },
      R = { function() vim.lsp.buf.references() end, "references" },
      w = { function() vim.lsp.buf.workspace_symbol() end, "workspace_symbol" },
    }
  }, { prefix = "<leader>", buffer = bufnr, noremap = true })

  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
