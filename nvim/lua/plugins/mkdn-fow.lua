
-- 'mkdn-flow'

return {
  'jakewvincent/mkdnflow.nvim',
  --  enabled = false,
  config = function()
    require('mkdnflow').setup({
      mappings = {
        MkdnGoForward = false,
        MkdnDestroyLink = {'n', '<Del>'},
        -- Config goes here; leave blank for defaults
      }
    })
  end
}
