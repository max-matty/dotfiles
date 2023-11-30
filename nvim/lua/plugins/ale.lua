
return {

  'dense-analysis/ale',
--  enabled = false,

  config = function ()
--    vim.g.ale_use_neovim_diagnostics_api = 1
    vim.cmd([[let g:ale_linters = {'markdown': ['mdl']}]])
  end

}

