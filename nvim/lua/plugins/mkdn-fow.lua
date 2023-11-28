
return {

  'jakewvincent/mkdnflow.nvim',
  enabled = false,

  config = function()
    require('mkdnflow').setup({
      mappings = {
        MkdnGoForward = false,
        MkdnDestroyLink = {'n', '<Del>'},
      },
      links = {
        transform_implicit = function (input)
         return('/home/max/shared/Workspace/Notes'..input)
        end
      },
      perspective = {
--        priority = 'current',
--        root_tell = '/home/max/shared/Workspace/Notes/index.md'
--        nvim_wd_heel = true
      },
    })
  end

}
