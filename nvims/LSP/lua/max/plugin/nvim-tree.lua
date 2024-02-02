return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = { -- require("nvim-tree").setup(opts)
    filters = {
      dotfiles = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
}
