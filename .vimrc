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
Plug 'tmsvg/pear-tree'            " [pear-tree]          = Auto-create pair & jump to end if matching pair typed
Plug 'wellle/targets.vim'         " [targets.vim]        = Adds a beautiful slew of text-objects
Plug 'junegunn/vim-easy-align'    " [vim-easy-align]     = Align text & tables
Plug 'yssl/QFEnter'               " [QFEnter]            = Better QF opening
Plug 'tomtom/tcomment_vim'        " [tcomment]           = Shortcuts for commenting
Plug 'justinmk/vim-dirvish'       " [vim-dirvish]        = File browsing
Plug 'skywind3000/asyncrun.vim'   " [asyncrun.vim]       = Easy async jobbies
Plug 'joereynolds/vim-minisnip'   " [vim-minisnip]       = Snippits!

" Syntax & Visual
Plug 'sainnhe/gruvbox-material'   " [gruvbox-material]
Plug 'morhetz/gruvbox'            " [gruvbox]            = Can't seem to beat it
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

" Fuzzy Finder
if has('win32')
    Plug 'ctrlpvim/ctrlp.vim'     " [ctrlp.vim]          = Fuzzy file finding
elseif has('mac') || has('unix')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif

" Completion
" if !has('nvim')
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-pyclang'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"======== [PLUGINS END] ========}}}

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
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
" let g:gruvbox_material_background='medium'
" let g:gruvbox_material_foreground='mix'
" let g:gruvbox_material_statusline_style='mix'
" colorscheme gruvbox-material

augroup myFileTypes
    au!
    autocmd FileType vim,help setlocal fdm=marker keywordprg=:help
    autocmd BufReadPost *.log.txt set ft=log

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
nnoremap ;; :cn<cr>
nnoremap ;: :cp<cr>

nnoremap ;' :ln<cr>
nnoremap ;" :lp<cr>
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
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
if has('win32')
    if executable('ag') | let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' | endif
    let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|/private/.*\|\.git/*'
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/](\.(git|hg|svn)|(vs2013|xcode|node_modules|vs2015))$',
                \ 'file': '\v\.(exe|so|dll|png|jpeg|jpg|otf|ttf)$'
                \ }
    let g:ctrlp_match_window = 'top,order:ttb,min:1,max:16,results:16'
    let g:ctrlp_match_current_file = 1
    let g:ctrlp_map = '<leader>f'
    nmap <silent> <leader>ur :CtrlPMRUFiles<cr>
    nmap <silent> <leader>ub :CtrlPBuffer<cr>
    nmap <silent> <leader>u/ :CtrlPLine<cr>
elseif has('mac') || has('unix')
    let g:fzf_layout = { 'down': '~24%' }
    let g:fzf_buffers_jump = 1
    nmap <silent> <leader>f :Files<cr>
    nmap <silent> <leader>/ :Lines<cr>
    nmap <silent> <leader>ur :History<cr>
    nmap <silent> <leader>ub :Buffers<cr>
endif

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
let g:asyncrun_open = 14

" [pear-tree]
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

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
