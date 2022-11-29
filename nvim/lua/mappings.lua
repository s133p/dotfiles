-- Personal Magic
vim.g.mapleader = ';'
vim.g.MagicStatusEnable=1
vim.g.MagicMapAll=1

-- Rooter
vim.g.rooter_change_directory_for_non_project_files = 'current'
vim.g.rooter_silent_chdir = 1

-- Drivish
vim.g.dirvish_mode = "sort ,^.*[^\\/],"
vim.g.dirvish_relative_paths= 1
vim.keymap.set('n', '-', '<Plug>(dirvish_up)')
local dirvishGrp = vim.api.nvim_create_augroup("MyDirvish", {clear = true })
vim.api.nvim_create_autocmd("FileType", {
		pattern = "dirvish",
		command = "nmap <buffer><Esc> gq",
		group = dirvishGrp
})

-- EasyAlign
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')

-- GIT

vim.keymap.set('n', '<leader>gs', '<Cmd>Git<cr>')
vim.keymap.set('n', '<leader>gb', '<Cmd>Gblame<cr>')
vim.keymap.set('n', '<leader>gd', '<Cmd>Gdiff<cr>')

-- GENERAL
vim.keymap.set('n', '<leader>.', '<Cmd>let @/=@\"<cr>/<cr>cgn<c-r>.<esc>')

vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', '<leader>w', '<Cmd>up<cr>')
vim.keymap.set('n', '<leader>x', '<Cmd>q<cr>')
vim.keymap.set('n', '<leader>ev', '<Cmd>e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', '<Cmd>so $MYVIMRC<cr>')

-- Splits/Windows/Buffers
vim.keymap.set('n', '<leader>v', '<c-w>v')
vim.keymap.set('n', '<leader>h', '<c-w>s')
vim.keymap.set('n', '<leader>t', '<Cmd>tabnew<cr>')
vim.keymap.set('n', 'gw', '<c-w>')
vim.keymap.set('n', 'g=', '<c-w>=')
vim.keymap.set('n', 'gk', '<C-W>k')
vim.keymap.set('n', 'gj', '<C-W>j')
vim.keymap.set('n', 'gh', '<C-W>h')
vim.keymap.set('n', 'gl', '<C-W>l')
vim.keymap.set('n', 'gb', '<c-^>')
-- -- swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
vim.keymap.set('n', '\'', '`')
vim.keymap.set('n', '`', '\'')

-- J & K as page-up/page-down, orginal functions shadowed on <leader>
vim.keymap.set({'n', 'v'}, 'J', '}')
vim.keymap.set({'n', 'v'}, 'K', '{')
vim.keymap.set({'n', 'v'}, '<leader>J', 'J')
vim.keymap.set({'n', 'v'}, 'g?', 'K')

vim.keymap.set('n', '<leader>un', "<Cmd>lua require('telekasten').panel()<CR>")

vim.keymap.set('n', '<leader>ur', "<Cmd>Telescope oldfiles<cr>")
vim.keymap.set('n', '<leader>ub', "<Cmd>Telescope buffers<cr>")
vim.keymap.set('n', '<leader>u/', "<Cmd>Telescope current_buffer_fuzzy_find<cr>")

vim.keymap.set("n", "<leader>as", "<Cmd>:Other<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>av", "<Cmd>:OtherVSplit<CR>", { noremap = true, silent = true })

