
return {

  'neovim/nvim-lspconfig',
  --  enabled = false,

  config = function ()

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require('lspconfig')

    -- Enable marksman servers
    lspconfig.marksman.setup {
      capabilities = capabilities, }

    -- Enable lua server
    lspconfig.lua_ls.setup {
      capabilities = capabilities, }

    -- Enable zk server
    lspconfig.zk.setup {
      capabilities = capabilities, }

  end

}

