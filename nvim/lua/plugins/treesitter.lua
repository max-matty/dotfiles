
-- treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
--  enabled = false,
  config = function ()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = { "c", "lua", "markdown", "markdown_inline", "org", "vim", "vimdoc", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}

