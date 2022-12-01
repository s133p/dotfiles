vim.opt.shortmess:append { s = true, I = true, a = true } -- disable startup message
vim.opt.backspace = vim.opt.backspace + { "nostop" } -- Don't stop backspace at insert
-- vim.opt.clipboard = "unnamedplus" -- Connection to the system clipboard
vim.opt.cmdheight = 2 -- hide command line unless needed
vim.opt.completeopt = { "menuone", "noselect" } -- Options for insert mode completion
vim.opt.copyindent = true -- Copy the previous indentation on autoindenting
vim.opt.cursorline = true -- Highlight the text line of the cursor
vim.opt.expandtab = false -- Enable the use of space in tab
vim.opt.fileencoding = "utf-8" -- File content encoding for the buffer
vim.opt.fillchars = { eob = " " } -- Disable `~` on nonexistent lines
vim.opt.list = true
vim.opt.listchars = {
	nbsp     = '⦸',
	extends  = '»',
	precedes = '«',
	trail    = '•',
	tab      = '→ '
}
vim.opt.history = 100 -- Number of commands to remember in a history table
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.laststatus = 2 -- globalstatus
vim.opt.lazyredraw = true -- lazily redraw screen
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.number = false -- Show numberline
vim.opt.preserveindent = true -- Preserve indent structure as much as possible
vim.opt.pumheight = 10 -- Height of the pop up menu
vim.opt.relativenumber = false -- Show relative numberline
vim.opt.scrolloff = 8 -- Number of lines to keep above and below the cursor

vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.tabstop=4
vim.opt.expandtab = false
vim.opt.textwidth=120

vim.opt.showmode = false -- Disable showing modes in command line
vim.opt.showtabline = 2 -- always display tabline
vim.opt.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.smartcase = true -- Case sensitivie searching
vim.opt.splitbelow = true -- Splitting a new window below the current one
vim.opt.splitright = true -- Splitting a new window at the right of the current one
vim.opt.swapfile = false -- Disable use of swapfile for the buffer
vim.opt.tabstop = 4 -- Number of space in a tab
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.timeout = false -- Length of time to wait for a mapped sequence
vim.opt.ttimeout = true -- Length of time to wait for a mapped sequence
vim.opt.ttimeoutlen = 200 -- Length of time to wait for a mapped sequence
-- vim.opt.timeoutlen = 300 -- Length of time to wait for a mapped sequence
vim.opt.undofile = true -- Enable persistent undo
vim.opt.updatetime = 300 -- Length of time to wait before triggering the plugin
vim.opt.wrap = false -- Disable wrapping of lines longer than the width of window
vim.opt.writebackup = false -- Disable making a backup before overwriting a file
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.hidden = true

-- vim.opt.shellslash = true

-- Abbrevs
vim.cmd("iabbrev ture true")
vim.cmd("iabbrev flase false")
vim.cmd("iabbrev fales false")
vim.cmd("iabbrev teh the")
vim.cmd("iabbrev :shrug: ¯\\_(ツ)_/¯")
vim.cmd("iabbrev &shrug; ¯\\_(ツ)_/¯")
vim.cmd("iabbrev flaot float")

-- Colors
vim.cmd("colorscheme gruvbox")

if (vim.fn.executable('ag') == 1) then
  vim.opt.grepprg = "ag --vimgrep"
  vim.opt.grepformat = '%f:%l:%c:%m,%f:%l%m,%f  %l%m'
end


