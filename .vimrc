set encoding=utf-8
scriptencoding utf-8
set secure
set shellslash
let g:mapleader=';'

"======== [PLUGINS] ========{{{
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-abolish'         " [vim-abolish]       = Coerce cases
Plug 'tpope/vim-surround'        " [vim-surround]      = Does what it says on the tin
Plug 'tpope/vim-repeat'          " [vim-repeat]        = Allow plugin mappings to be repeated w/ '.'
Plug 'spiiph/vim-space'          " [vim-space]         = Use spacebar to repeat last movement
Plug 'cohama/lexima.vim'         " [lexima-vim]        = Auto-create pair & jump to end if matching pair typed
Plug 'wellle/targets.vim'        " [targets.vim]       = Adds a beautiful slew of text-objects
Plug 'junegunn/vim-easy-align'   " [vim-easy-align]    = Replacees tabular, includes text-obj mappings
Plug 'yssl/QFEnter'              " [QFEnter]           = Better QF opening
Plug 'tomtom/tcomment_vim'       " [tcomment]          = Shortcuts for commenting
Plug 'justinmk/vim-dirvish'      " [vim-dirvish]       = File browsing
Plug 'mattn/webapi-vim'          " [webapi-vim]        = Required for [gist-vim]
Plug 'mattn/gist-vim'            " [gist-vim]          = Gists from within vim
Plug 'junegunn/gv.vim'           " [GV-vim]            = Pretty git history/log

" Syntax & Visual
Plug 'morhetz/gruvbox'           " [gruvbox]           = Can't seem to beat it
Plug 'sheerun/vim-polyglot'      " [vim-polyglot]      = Better FT/Syntax plugins
Plug 'dzeban/vim-log-syntax'     " [vim-log-syntax]    = Syntax highlighting for log files

" Git / project
Plug 'airblade/vim-rooter'       " [vim-rooter]        = Change directory to root of projects
Plug 'tpope/vim-fugitive'        " [vim-fugitive]      = Git integration

" Personal functions
Plug 's133p/personal-magic.vim'  " [personal-magic.vim] = A collection of person vim functions

" Fuzzy Finder
if has('mac') || has('unix')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
elseif has('win32')
    Plug 'ctrlpvim/ctrlp.vim'    " [ctrlp.vim]          = Fuzzy file finding
endif

" Completion
if has('nvim') || has('mac')
    if !has('nvim')
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'roxma/nvim-completion-manager'
    Plug 'roxma/ncm-clang'
else
    Plug 'maralla/completor.vim' " [completor.vim]      = Autocomplete
endif

call plug#end()
"======== [PLUGINS END] ========}}}

"======== [Settings] ========{{{
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
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab textwidth=120
set nohlsearch incsearch ignorecase smartcase showmatch
set list listchars=nbsp:⦸,extends:»,precedes:«,trail:•,tab:\|-

" Theme
set background=dark termguicolors
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

augroup myFileTypes
    au!
    autocmd FileType vim,help setlocal fdm=marker keywordprg=:help
    autocmd FileType c,cpp,xml setlocal fdm=syntax
    autocmd FileType vim,c,cpp setlocal nofoldenable foldopen=all foldclose=all foldnestmax=10

    autocmd BufReadPost *.log.txt set ft=log

    autocmd BufNewFile,BufReadPost *.tag set ft=javascript.jsx
    autocmd FileType javascript,javascript.jsx,css,less setlocal softtabstop=2 tabstop=2 shiftwidth=2
    autocmd FileType yaml setlocal softtabstop=4 tabstop=4 shiftwidth=4

    autocmd Filetype markdown setlocal wrap textwidth=100 linebreak spell nofoldenable
    autocmd Filetype markdown nnoremap <buffer> j gj
    autocmd Filetype markdown nnoremap <buffer> k gk
augroup END
"======== [END Settings] ========}}}

"======== [MAPPINGS] ========{{{
" Abbreviations for common flubs
iabbrev ture true
iabbrev flase false
iabbrev fales false
iabbrev teh the

" Vimgrep shorcuts for ds_cinder projects
if executable('ag')
    let &grepprg='ag --vimgrep'
    let &grepformat='%f:%l:%c:%m,%f:%l%m,%f  %l%m'
elseif executable('grep')
    set grepprg=grep
endif
"
" after c{motion}, <leader>. jumps to next instance of text and replaces
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

nnoremap Y y$
nnoremap <leader><leader> q:
nnoremap <Leader>w :up<CR>
nnoremap <leader>x :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>Gwgf
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Splits/Windows/Buffers
nnoremap <leader>v <c-w>v
nnoremap <leader>V <c-w>s
nnoremap <leader>t :tabnew<CR>
nnoremap gw <c-w>
nnoremap g= <c-w>=
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap gb <c-^>
nnoremap <bs> <c-^>
nnoremap <C-l> gt
nnoremap <C-h> gT
nmap gs ys

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K as page-up/page-down, orginal functions shadowed on <leader>
nnoremap J <c-d>
vnoremap J <c-d>
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap <leader>J J
vnoremap <leader>J J
nnoremap g? K
vnoremap g? K
"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

" [personal-magic.vim]
let g:MagicStatusEnable=1
let g:MagicMapAll=1
" let g:MagicStatusGitExtra=0

" [vim-polyglot]
let g:jsx_ext_required = 1

" [vim-dirvish]
nmap - <Plug>(dirvish_up)
let g:dirvish_mode = 'sort ,^.*[^\/],'
augroup myDirvish
    autocmd!
    autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _
    autocmd FileType dirvish nmap <buffer><Esc> q
augroup END

" [vim-easy-align]
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" [completor.vim & nvim-completion-manager]
if has('nvim') || has('mac')
    " Use Nvim-completion manager
    imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
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
elseif has('mac') || has('unix')
    let g:fzf_layout = { 'down': '~24%' }
    let g:fzf_buffers_jump = 1
    nmap <silent> <leader>f :Files<cr>
    nmap <silent> <leader>/ :Lines<cr>
    nmap <silent> <leader>ur :History<cr>
    nmap <silent> <leader>ub :Buffers<cr>
endif

" [vim-fugitive] & [gist-vim]
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gb :Gbrowse<cr>
nmap <leader>gB :Gblame<cr>
nmap <leader>gd :Gdiff<cr>

augroup MyFugitive
    autocmd!
    autocmd BufReadPost fugitive://* setlocal bufhidden=delete foldopen=
    autocmd BufEnter .git/index nmap <buffer> n <c-n>
    autocmd BufEnter .git/index nmap <buffer> p <c-p>
augroup END

let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 0
nmap <leader>Gl :Gist -l<cr>
nmap <leader>Gb :Gist -b<cr>

" [targets.vim]
" let g:targets_aiAI = 'aiAI'              " Swap ciX and cIX
" let g:targets_pairs = '()p {}b []B <>'   " Use p for (), b for {} and B for []

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
