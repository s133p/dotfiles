set encoding=utf-8
scriptencoding utf-8
set secure
let g:mapleader=';'

"======== [PLUGINS] ========{{{
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-abolish'          " [vim-abolish]        = Coerce cases
Plug 'tpope/vim-surround'         " [vim-surround]       = Does what it says on the tin
Plug 'tpope/vim-repeat'           " [vim-repeat]         = Allow plugin mappings to be repeated w/ '.'
Plug 'tpope/vim-unimpaired'       " [vim-unimpaired]     = Lovely & simple paired mappings

Plug 'spiiph/vim-space'           " [vim-space]          = Use spacebar to repeat last movement
Plug 'wellle/targets.vim'         " [targets.vim]        = Adds a beautiful slew of text-objects
Plug 'junegunn/vim-easy-align'    " [vim-easy-align]     = Align text & tables
Plug 'justinmk/vim-dirvish'       " [vim-dirvish]        = File browsing
Plug 'skywind3000/asynctasks.vim' " [asynctasks.vim]     = Extends asyncrun
Plug 'skywind3000/asyncrun.vim'   " [asyncrun.vim]       = Easy async jobbies

" Syntax & Visual
Plug 'sainnhe/gruvbox-material'   " [gruvbox-material]   = Gruvbox Material
Plug 'ellisonleao/gruvbox.nvim'   " [gruvbox.nvim]       = Neovim gruvbox
Plug 'sheerun/vim-polyglot'       " [vim-polyglot]       = Better FT/Syntax plugins
Plug 'dzeban/vim-log-syntax'      " [vim-log-syntax]     = Syntax highlighting for log files
Plug 'plasticboy/vim-markdown'    " [vim-markdown]       = Nice markdown helpers

" Git / project
Plug 'airblade/vim-rooter'        " [vim-rooter]         = Change directory to root of projects
Plug 'tpope/vim-fugitive'         " [vim-fugitive]       = Git integration
Plug 'junegunn/gv.vim'            " [GV-vim]             = Pretty git history/log
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/alternate-lite' " [alternate-lite]     = Switch to alternate file

" Personal functions
Plug 's133p/personal-magic.vim'   " [personal-magic.vim] = A collection of person vim functions

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'folke/zen-mode.nvim'
Plug 'renerocksai/calendar-vim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'renerocksai/telekasten.nvim'
Plug 'jakewvincent/mkdnflow.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'rcarriga/nvim-notify'

" Under consideration
Plug 'b3nj5m1n/kommentary'        " [tcomment]           = Shortcuts for commenting
"Plug 'tomtom/tcomment_vim'        " [tcomment]           = Shortcuts for commenting
Plug 'yssl/QFEnter'               " [QFEnter]            = Better QF opening
" Plug 'joereynolds/vim-minisnip'   " [vim-minisnip]       = Snippits!
" Plug 'tmsvg/pear-tree'            " [pear-tree]          = Auto-create pair & jump to end if matching pair typed

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"======== [PLUGINS END] ========}}}

lua << EOF
require('kommentary.config').configure_language("rust", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
})

local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
        i = {
            ["<esc>"] = actions.close
        },
    },
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
}

require("zen-mode").setup {
window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 180, -- width of the Zen window
    height = 1, -- height of the Zen window
    options = {
    },
  },
}
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

-- Load custom tree-sitter grammar for org filetype
-- Tree-sitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'cpp', 'markdown'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'cpp', 'markdown', 'markdown_inline', 'lua'}, -- Or run :TSUpdate org
}

require('mkdnflow').setup({
    mappings = {
        MkdnEnter = {{'n', 'v'}, '<CR>'},
        MkdnTab = false,
        MkdnSTab = false,
        MkdnNextLink = {'n', '<Tab>'},
        MkdnPrevLink = {'n', '<S-Tab>'},
        MkdnNextHeading = {'n', ']]'},
        MkdnPrevHeading = {'n', '[['},
        MkdnGoBack = {'n', '<BS>'},
        MkdnGoForward = {'n', '<Del>'},
        MkdnFollowLink = false, -- see MkdnEnter
        MkdnDestroyLink = {'n', '<M-CR>'},
        MkdnTagSpan = {'v', '<M-CR>'},
        MkdnMoveSource = {'n', '<F2>'},
        MkdnYankAnchorLink = {'n', 'ya'},
        MkdnYankFileAnchorLink = {'n', 'yfa'},
        MkdnIncreaseHeading = false,
        MkdnDecreaseHeading = false,
        MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
        MkdnNewListItem = false,
        MkdnNewListItemBelowInsert = {'n', 'o'},
        MkdnNewListItemAboveInsert = {'n', 'O'},
        MkdnExtendList = false,
        MkdnUpdateNumbering = {'n', '<leader>nn'},
        MkdnTableNextCell = {'i', '<Tab>'},
        MkdnTablePrevCell = {'i', '<S-Tab>'},
        MkdnTableNextRow = false,
        MkdnTablePrevRow = {'i', '<M-CR>'},
        MkdnTableNewRowBelow = {'n', '<leader>ir'},
        MkdnTableNewRowAbove = {'n', '<leader>iR'},
        MkdnTableNewColAfter = {'n', '<leader>ic'},
        MkdnTableNewColBefore = {'n', '<leader>iC'},
        MkdnFoldSection = {'n', '<leader>f'},
        MkdnUnfoldSection = {'n', '<leader>F'}
    }
    -- Config goes here; leave blank for defaults
})

local home = vim.fn.expand("~/zettelkasten")
require('telekasten').setup({
    home         = home,
    take_over_my_home = true,
    auto_set_filetype = true,
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',
    image_subdir = "img",
    extension    = ".md",
    new_note_filename = "title",
    uuid_type = "%Y%m%d%H%M",
    uuid_sep = "-",
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,
    journal_auto_open = false,
    template_new_note = home .. '/' .. 'templates/new_note.md',
    template_new_daily = home .. '/' .. 'templates/daily.md',
    template_new_weekly= home .. '/' .. 'templates/weekly.md',
    image_link_style = "markdown",
    sort = "filename",
    plug_into_calendar = true,
    calendar_opts = {
        weeknm = 4,
        calendar_monday = 1,
        calendar_mark = 'left-fit',
    },
    close_after_yanking = false,
    insert_after_inserting = true,
    tag_notation = "#tag",
    command_palette_theme = "popup",
    show_tags_theme = "ivy",
    subdirs_in_links = true,
    template_handling = "smart",
    new_note_location = "smart",
    rename_update_links = true,
    media_previewer = "telescope-media-files",
})


require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git" },
  ignore_lsp = {},
  exclude_dirs = {},
  show_hidden = false,
  silent_chdir = true,
  scope_chdir = 'global',
  datapath = vim.fn.stdpath("data"),
  }
require('telescope').load_extension('projects')

EOF

"======== [Settings] ========{{{
set shellslash
filetype indent plugin on
syntax on
set hidden noswapfile
set showcmd confirm cmdheight=2 nostartofline lazyredraw
set novisualbell t_vb= mouse=a backspace=2
set notimeout ttimeout ttimeoutlen=200
set splitbelow splitright switchbuf=usetab
set t_Co=256 termguicolors
set shortmess=Ia laststatus=2
set cursorline scrolloff=6 nowrap
set shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab textwidth=100
set nowrap nolinebreak
set nohlsearch incsearch ignorecase smartcase showmatch
set list listchars=nbsp:⦸,extends:»,precedes:«,trail:•,tab:→\ 
set fdm=syntax nofoldenable
set nobackup nowritebackup

" Theme
set background=dark termguicolors
colorscheme gruvbox

augroup myFileTypes
    au!
    autocmd FileType vim,help setlocal fdm=marker keywordprg=:help
    autocmd BufReadPost *.log.txt set ft=log
    autocmd BufReadPost *.comp set ft=glsl

    autocmd FileType javascript,javascript.jsx,css,less setlocal softtabstop=2 tabstop=2 shiftwidth=2
    autocmd FileType yaml setlocal softtabstop=4 tabstop=4 shiftwidth=4
    autocmd FileType vim,markdown setlocal expandtab textwidth=120
    autocmd Filetype markdown setlocal wrap linebreak spell
    autocmd Filetype markdown nnoremap <buffer> j gj
    autocmd Filetype markdown nnoremap <buffer> k gk
    autocmd Filetype markdown nnoremap <buffer> gq gw
    autocmd Filetype vimwiki setlocal wrap linebreak spell textwidth=120
augroup END
"======== [END Settings] ========}}}

"======== [MAPPINGS] ========{{{
" Abbreviations for common flubs
iabbrev ture true
iabbrev flase false
iabbrev fales false
iabbrev teh the
iabbrev :shrug: ¯\_(ツ)_/¯
iabbrev &shrug; ¯\_(ツ)_/¯
iabbrev flaot float

" Use ag for grep if possible
if executable('ag')
    let &grepprg='ag --vimgrep'
    let &grepformat='%f:%l:%c:%m,%f:%l%m,%f  %l%m'
elseif executable('grep')
    set grepprg=grep
endif

" after c{motion}, <leader>. jumps to next instance of text and replaces
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

nnoremap Y y$
nnoremap <Leader>w :up<CR>
nnoremap <leader>x :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>Gwgf
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Splits/Windows/Buffers
nnoremap <leader>v <c-w>v
nnoremap <leader>h <c-w>s
nnoremap <leader>t :tabnew<CR>
nnoremap gw <c-w>
nnoremap g= <c-w>=
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap gb <c-^>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K as page-up/page-down, orginal functions shadowed on <leader>
nnoremap J }
vnoremap J }
nnoremap K {
vnoremap K {
nnoremap <leader>J J
vnoremap <leader>J J
nnoremap g? K
vnoremap g? K

" Zen
nnoremap <leader><leader> :ZenMode<cr>

" Telescope powers
nnoremap <silent> <leader>un :lua require('telekasten').panel()<CR>
nnoremap <silent> <leader>ur :Telescope oldfiles<cr>
nnoremap <silent> <leader>ub :Telescope buffers<cr>
nnoremap <silent> <leader>up :Telescope projects<cr>
nnoremap <silent> <leader>u/ :Telescope current_buffer_fuzzy_find<cr>

"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

" [calendar]
let g:calendar_no_mappings=1

" [personal-magic.vim]
let g:MagicStatusEnable=1
let g:MagicMapAll=1

" [vim-polyglot]
let g:jsx_ext_required = 1

" [vim-dirvish]
nmap - <Plug>(dirvish_up)
let g:dirvish_mode = 'sort ,^.*[^\/],'
let g:dirvish_relative_paths = 1
augroup myDirvish
    autocmd!
    autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _
    autocmd FileType dirvish nmap <buffer><Esc> gq
augroup END

" [vim-easy-align]
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" [completor.vim & nvim-completion-manager]
" let g:minisnip_dir = '~/.vim/bundle/personal-magic.vim/templates/minisnip'
" let g:minisnip_trigger = '<C-j>'
if has('nvim') || has('mac')
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> <leader>k :call ShowDocumentation()<CR>

    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction

    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    nmap cof gg;fG''

    nmap <silent> <leader>da  <Plug>(coc-codeaction)
    nmap <silent> <leader>df  <Plug>(coc-fix-current)
    nmap <silent> <leader>dl  <Plug>(coc-codelens-action)
    nmap <silent> <leader>Re <Plug>(coc-refactor)
    xmap <silent> <leader>R  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>R  <Plug>(coc-codeaction-refactor-selected)
    " Symbol renaming.
    nmap <leader>dr <Plug>(coc-rename)

    " Run the Code Lens action on the current line.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Highlight the symbol and its references when holding the cursor.
    augroup mycocgroup
        autocmd!
        autocmd CursorHold * silent call CocActionAsync('highlight')
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json,cpp,markdown,xml,rust setl formatexpr=CocAction('formatSelected')
        autocmd FileType typescript,json,cpp,markdown,xml,rust xnoremap <buffer> = <Plug>(coc-format-selected)
        autocmd FileType typescript,json,cpp,markdown,xml,rust nnoremap <buffer> = <Plug>(coc-format-selected)
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end


    " Mappings for CoCList
    " Show all diagnostics.
    " nnoremap <silent><nowait> <leader>cd  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    " nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
    " Show commands.
    " nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    " nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    " nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    " nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
    " Do default action for previous item.
    " nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    " nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c
    let g:coc_global_extensions = ['coc-json', 'coc-pairs', 'coc-tsserver', 'coc-clangd', 'coc-calc', 'coc-toml', 'coc-clang-format-style-options', 'coc-cmake', 'coc-snippets', 'coc-tasks', 'coc-vimlsp', 'coc-xml']

    " Extension specific

    function! s:MagicDo(type, what_magic, ...)
        echo a:what_magic
        let l:sel_save = &selection
        let &selection = 'inclusive'
        let l:reg_save = @@

        if a:type ==? 'v'  " Invoked from Visual mode, use gv command.
            silent exe 'normal! gv' . a:what_magic
        elseif a:type ==? 'line'
            silent exe "normal! '[V']" . a:what_magic
        else
            silent exe 'normal! `[v`]' . a:what_magic
        endif

        let &selection = l:sel_save
        let @@ = l:reg_save
    endfunction
    function! MyCocCalc(type, ...)
        call s:MagicDo(a:type, "c\<c-r>=CocAction('runCommand', 'calc.calculate', '\<c-r>\"')\<cr>", a:000)
    endfunction
    nnoremap <Plug>(MyCocCalc) :set opfunc=MyCocCalc<CR>g@
    vnoremap <Plug>(MyCocCalc) :<C-U>call MyCocCalc(visualmode())<CR>
    map <leader>c <Plug>(MyCocCalc)
    nmap <leader>C <Plug>(coc-calc-result-replace)

lua << EOF
vim.notify = require("notify")
vim.notify.setup({
    top_down = false,
    icons = {
        DEBUG = " ",
        ERROR = "🛑 ",
        INFO = "ℹ️ ",
        TRACE = "✎ ",
        WARN = "🔥 "
        },
    render = "default",
    timeout = 1000
})

local coc_status_record = {}

function coc_status_notify(msg, level)
  local notify_opts = { title = "LSP Status", timeout = 500, hide_from_history = true, on_close = reset_coc_status_record }
  -- if coc_status_record is not {} then add it to notify_opts to key called "replace"
  if coc_status_record ~= {} then
    notify_opts["replace"] = coc_status_record.id
  end
  coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
  coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
  local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
  -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
  if coc_diag_record ~= {} then
    notify_opts["replace"] = coc_diag_record.id
  end
  coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
  coc_diag_record = {}
end
EOF

    function! s:DiagnosticNotify() abort
      let l:info = get(b:, 'coc_diagnostic_info', {})
      if empty(l:info) | return '' | endif
      let l:msgs = []
      let l:level = 'info'
       if get(l:info, 'warning', 0)
        let l:level = 'warn'
      endif
      if get(l:info, 'error', 0)
        let l:level = 'error'
      endif

      if get(l:info, 'error', 0)
        call add(l:msgs, '🚩 Errors: ' . l:info['error'])
      endif
      if get(l:info, 'warning', 0)
        call add(l:msgs, '🔥 Warnings: ' . l:info['warning'])
      endif
      if get(l:info, 'information', 0)
        call add(l:msgs, 'ℹ️ Infos: ' . l:info['information'])
      endif
      if get(l:info, 'hint', 0)
        call add(l:msgs, '💯 Hints: ' . l:info['hint'])
      endif
      let l:msg = join(l:msgs, "\n")
      if empty(l:msg) | let l:msg = ' All OK' | endif
      call v:lua.coc_diag_notify(l:msg, l:level)
    endfunction

    function! s:StatusNotify() abort
      let l:status = get(g:, 'coc_status', '')
      let l:level = 'info'
      if empty(l:status) | return '' | endif
      call v:lua.coc_status_notify(l:status, l:level)
    endfunction

    function! s:InitCoc() abort
      execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
    endfunction

    " notifications
    augroup MyCoCThigns
        autocmd!
        " autocmd User CocNvimInit call s:InitCoc()
        " autocmd User CocDiagnosticChange call s:DiagnosticNotify()
        " autocmd User CocStatusChange call s:StatusNotify()
    augroup END

    nmap <space>e <Cmd>CocCommand explorer<cr>

endif

" [vim-rooter]
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1

" [alternate-lite]
call lh#alternate#register_extension('g', 'frag', ['vert'])
call lh#alternate#register_extension('g', 'vert', ['frag'])

" [vim-fugitive] & [gist-vim]
nmap <leader>gs :Git<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>

augroup MyFugitive
    autocmd!
    autocmd BufReadPost fugitive://* setlocal bufhidden=delete foldopen=
    autocmd BufEnter .git/index nmap <buffer> n <c-n>
    autocmd BufEnter .git/index nmap <buffer> p <c-p>
augroup END

" [asyncrun.vim & asynctasks.vim]
let g:asyncrun_open = 10
let g:asynctasks_profile = 'release'
let g:asynctasks_term_close=1
function! CloseQfOnSuccess()
    if g:asyncrun_code == 0
        cclose
        lua vim.notify("Build succeeded", "info", {title = 'Build'})
    else
        lua vim.notify("Build failed!", "error", {title = 'Build'})
        copen
        norm gwp
    endif
endfunction
function! CloseQfForBuild()
    if g:asynctasks_last != 'run' && g:asynctasks_last != 'test'
        cclose
    endif
endfunction
augroup MyAsyncRun
    autocmd!
    autocmd User AsyncRunStart call CloseQfForBuild()
    autocmd User AsyncRunStart lua vim.notify(vim.api.nvim_get_var("asynctasks_last") .. "ing " .. vim.api.nvim_get_var("asynctasks_profile"), "info", {title = "Build"})
    autocmd User AsyncRunStop call CloseQfOnSuccess()
augroup END


" [pear-tree]
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_ft_disabled = ["TelescopePrompt"]
let g:pear_tree_map_special_keys = 1

"======== [END Plugin mappings/settings] ========}}}

"======== [Gvim] ========{{{
if has('win32') && has('gui')
    augroup GuiVim
        au!
        set guioptions=c  "only console prompt, no other ui-chrome
        set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI:qDRAFT
        " Fullscreen on app-start
        au GUIEnter * simalt ~x
        au GUIEnter * set visualbell t_vb=
    augroup END
endif
"======== [END Gvim / MacVim] ========}}}

if exists('g:neovide')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
    let g:neovid_cursor_animation_length=0.008
endif


