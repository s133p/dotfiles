require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "pattern" },
  patterns = { ".git" },
  ignore_lsp = {},
  exclude_dirs = {"c:/", "c:", "c:/Program Files/Neovim/bin", "c:/Program Files/Neovide"},
  show_hidden = false,
  silent_chdir = true,
  scope_chdir = 'global',
  datapath = vim.fn.stdpath("data"),
  }
require('telescope').load_extension('projects')
