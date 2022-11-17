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
" Plug 'tmsvg/pear-tree'            " [pear-tree]          = Auto-create pair & jump to end if matching pair typed
Plug 'wellle/targets.vim'         " [targets.vim]        = Adds a beautiful slew of text-objects
Plug 'junegunn/vim-easy-align'    " [vim-easy-align]     = Align text & tables
Plug 'yssl/QFEnter'               " [QFEnter]            = Better QF opening
Plug 'tomtom/tcomment_vim'        " [tcomment]           = Shortcuts for commenting
Plug 'justinmk/vim-dirvish'       " [vim-dirvish]        = File browsing
Plug 'skywind3000/asynctasks.vim' " [asynctasks.vim]     = Extends asyncrun
Plug 'skywind3000/asyncrun.vim'   " [asyncrun.vim]       = Easy async jobbies
Plug 'joereynolds/vim-minisnip'   " [vim-minisnip]       = Snippits!

" Syntax & Visual
Plug 'sainnhe/gruvbox-material'   " [gruvbox-material]
" Plug 'morhetz/gruvbox'            " [gruvbox]            = Can't seem to beat it
Plug 'ellisonleao/gruvbox.nvim'
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
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/zen-mode.nvim'
Plug 'renerocksai/calendar-vim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'renerocksai/telekasten.nvim'
Plug 'jakewvincent/mkdnflow.nvim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"======== [PLUGINS END] ========}}}

lua << EOF
require("zen-mode").setup {
window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 180, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
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
  ensure_installed = {'cpp', 'markdown', 'markdown_inline'}, -- Or run :TSUpdate org
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
-- NOTE for Windows users:
-- - don't use Windows
-- - try WSL2 on Windows and pretend you're on Linux
-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
-- - NEVER use "C:\Users\myname" style paths
-- - Using `vim.fn.expand("~/zettelkasten")` should work now but mileage will vary with anything outside of finding and opening files
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- Generate note filenames. One of:
    -- "title" (default) - Use title if supplied, uuid otherwise
    -- "uuid" - Use uuid
    -- "uuid-title" - Prefix title by uuid
    -- "title-uuid" - Suffix title with uuid
    new_note_filename = "title",
    -- file uuid type ("rand" or input for os.date()")
    uuid_type = "%Y%m%d%H%M",
    -- UUID separator
    uuid_sep = "-",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- skip telescope prompt for goto_today and goto_thisweek
    journal_auto_open = false,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- default sort option: 'filename', 'modified'
    sort = "filename",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "popup",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,

    -- how to preview media files
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    media_previewer = "telescope-media-files",
})

EOF

" nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
" nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
" nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
" nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
" nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
" nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
" nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
" nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
" nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
" nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
" nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
" nnoremap <leader>zC :CalendarT<CR>
" nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
" nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
" nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
" nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
" nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
" nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
" nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
" nnoremap <leader>za :lua require('telekasten').show_tags()<CR>
" nnoremap <leader># :lua require('telekasten').show_tags()<CR>
" nnoremap <leader>zr :lua require('telekasten').rename_note()<CR>
" on hesitation, bring up the panel

nnoremap <leader><leader> :ZenMode<cr>
nnoremap <silent> <leader>un :lua require('telekasten').panel()<CR>
nmap <silent> <leader>ur :Telescope oldfiles<cr>
nmap <silent> <leader>ub :Telescope buffers<cr>
nmap <silent> <leader>u/ :Telescope current_buffer_fuzzy_find<cr>

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

" Theme
set background=dark termguicolors
" let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
" let g:gruvbox_material_background='medium'
" let g:gruvbox_material_foreground='mix'
" let g:gruvbox_material_statusline_style='mix'
" colorscheme gruvbox-material

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

" Jump through the errorlist
" nnoremap ;; :cn<cr>
" nnoremap ;: :cp<cr>
"
" nnoremap ;' :ln<cr>
" nnoremap ;" :lp<cr>
"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

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
let g:minisnip_dir = '~/.vim/bundle/personal-magic.vim/templates/minisnip'
let g:minisnip_trigger = '<C-j>'
if has('nvim') || has('mac')
    " Use Nvim-completion manager
    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
    " " Use <TAB> to select the popup menu:
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "
	" augroup MyNcm
	" 	autocmd!
	" 	autocmd BufEnter * call ncm2#enable_for_buffer()
    "     autocmd BufReadPre fugitive://* call ncm2#disable_for_buffer()
	" 	autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
	" augroup END
    "
	" if has('win32')
	" 	let g:ncm2_pyclang#library_path = '/Program Files/LLVM/bin/libclang.dll'
	" 	let g:ncm2_pyclang#args_file_path = ['.clang_complete']
    "     let g:ncm2_pyclang#sys_inc_args_fallback = {'': ''}
	" else
	" 	let g:ncm2_pyclang#library_path = '/usr/local/Cellar/llvm/7.0.0_1/lib'
	" 	let g:ncm2_pyclang#database_path = [
	" 				\ 'compile_commands.json',
	" 				\ 'build/compile_commands.json'
	" 				\ ]
	" endif
	" set completeopt=noinsert,menuone,noselect
    set signcolumn=number
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ CheckBackspace() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <c-space> coc#refresh()
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    " imap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    "                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<Plug>(PearTreeExpand)"
    "inoremap <expr> <Esc> pumvisible() ? "\<Esc>" : "\<Plug>(PearTreeFinishExpansion)"
    " imap <BS> <Plug>(PearTreeBackspace)

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

    " Highlight the symbol and its references when holding the cursor.
    " autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader><space>r <Plug>(coc-rename)
    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <leader><space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <leader><space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <leader><space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <leader><space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <leader><space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <leader><space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <leader><space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <leader><space>p  :<C-u>CocListResume<CR>

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c
else
    " Use Completor
    let g:completor_completion_delay=40
    let g:completor_refresh_always=0

    imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
endif

" [vim-rooter]
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1

" [alternate-lite]
call lh#alternate#register_extension('g', 'frag', ['vert'])
call lh#alternate#register_extension('g', 'vert', ['frag'])

" [fzf.vim] [ctrlp.vim]
" if has('win32')
"     if executable('ag') | let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' | endif
"     let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|/private/.*\|\.git/*'
"     let g:ctrlp_custom_ignore = {
"                 \ 'dir':  '\v[\/](\.(git|hg|svn)|(vs2013|xcode|node_modules|vs2015|vs2019|build|cmake))$',
"                 \ 'file': '\v\.(exe|so|dll|png|jpeg|jpg|otf|ttf)$'
"                 \ }
"     let g:ctrlp_match_window = 'top,order:ttb,min:1,max:16,results:16'
"     let g:ctrlp_match_current_file = 1
"     let g:ctrlp_map = '<leader>f'
"     nmap <silent> <leader>ur :CtrlPMRUFiles<cr>
"     nmap <silent> <leader>ub :CtrlPBuffer<cr>
"     nmap <silent> <leader>u/ :CtrlPLine<cr>
" elseif has('mac') || has('unix')
"     let g:fzf_layout = { 'down': '~24%' }
"     let g:fzf_buffers_jump = 1
"     nmap <silent> <leader>f :Files<cr>
"     nmap <silent> <leader>/ :Lines<cr>
"     nmap <silent> <leader>ur :History<cr>
"     nmap <silent> <leader>ub :Buffers<cr>
" endif

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

" [asyncrun.vim]
let g:asyncrun_open = 10
let g:asynctasks_profile = 'release'


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


