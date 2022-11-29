-- Load custom tree-sitter grammar for org filetype
-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'cpp', 'markdown'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'cpp', 'markdown', 'markdown_inline', 'vim', 'lua'}, -- Or run :TSUpdate org
}
