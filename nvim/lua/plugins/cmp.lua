
return {

  'hrsh7th/nvim-cmp',
  --  enabled = false,

  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'dmitmel/cmp-cmdline-history',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
  },


  config = function()

    ---------------------------------------
    -- nvim-cmp setup
    ---------------------------------------

    -- luasnip setup
    local luasnip = require 'luasnip'

    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            zk = "[Zk]",
            luasnip = "[Snippet]",
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end
      },
      sources = cmp.config.sources({
        { name = 'zk' },
        { name = 'luasnip' },
        --    { name = 'mkdnflow' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        --    { name = 'orgmode' },
      }),
    }


    ---------------------------------------
    -- setup cmp-cmdline
    ---------------------------------------

    -- `/` cmdline setup.
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'cmdline_history' }
      })
    })

  end,

}

