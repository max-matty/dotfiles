
-- treesitter

-- return {

--   'nvim-treesitter/nvim-treesitter',
--   build = ':TSUpdate',
--  enabled = false 

-- }


-- passing option to the plugin
-- (not tested)

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  config = function ()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = { "c", "lua", "markdown", "vim", "rst", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}

