set secure
set shellslash
let mapleader=';'

"======== [PLUGINS] ========{{{
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-sensible'             " [vim-sensible]       = Sensible defaults
Plug 'tpope/vim-abolish'              " [vim-abolish]        = Coerce cases
Plug 'tpope/vim-surround'             " [vim-surround]       = Does what it says on the tin
Plug 'tpope/vim-repeat'               " [vim-repeat]         = Allow plugin mappings to be repeated w/ '.'

" Git / project
Plug 'airblade/vim-rooter'            " [vim-rooter]         = Change directory to root of projects
Plug 'tpope/vim-fugitive'             " [vim-fugitive]       = Git integration
Plug 'tpope/vim-rhubarb'              " [vim-rhubarb]        = GitHub Specific git integration (for :Gbrowse)
Plug 'junegunn/gv.vim'                " [gv]                 = Git log viewing
Plug 'mattn/webapi-vim'               " [webapi-vim]         = Required for [gist-vim]
Plug 'mattn/gist-vim'                 " [gist-vim]           = Gists from within vim
Plug 'yssl/QFEnter'                   " [QFEnter]            = Better QF handling

Plug 'spiiph/vim-space'               " [vim-space]          = Use spacebar to repeat last movement
Plug 'cohama/lexima.vim'              " [lexima-vim]         = Auto-create pair & jump to end if matching pair typed
Plug 'wellle/targets.vim'             " [targets.vim]        = Adds a beautiful slew of text-objects
Plug 'junegunn/vim-easy-align'        " [vim-easy-align]     = Replacees tabular, includes text-obj mappings

" Syntax & Visual
Plug 'plasticboy/vim-markdown'        " [vim-markdown]       = markdown highlighting
Plug 'sheerun/vim-polyglot'           " [vim-polyglot]       = Better FT/Syntax plugins
Plug 'dzeban/vim-log-syntax'          " [vim-log-syntax]     = Syntax highlighting for log files
Plug 'google/vim-searchindex'         " [vim-searchindex]    = Show current match # + total match count during search

" Themes
Plug 'morhetz/gruvbox'                " [gruvbox]            = Pretty theme!

" Code / Language specific
Plug 'tomtom/tcomment_vim'            " [tcomment]           = Shortcuts for commenting
Plug 'maralla/completor.vim'          " [completor.vim]      = Autocomplete

Plug 'tpope/vim-projectionist'        " [vim-projectionist]  = Alternate files + templates for new files

if has("mac")
    Plug 'fatih/vim-go'               " [vim-go]             = Lots of nice go features
endif

" Quick file navigation
if has("mac") || has("unix")
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
elseif has("win32")
    Plug 'ctrlpvim/ctrlp.vim'             " [ctrlp.vim]          = Fuzzy file finding
endif

" Personal functions
Plug 's133p/personal-magic.vim'       " [personal-magic.vim] = A collection of person vim functions

call plug#end()
"======== [PLUGINS END] ========}}}

"======== [Settings] ========{{{
filetype indent plugin on
syntax on
set hidden noswapfile
set showcmd confirm cmdheight=2 nostartofline
set novisualbell t_vb= mouse=a backspace=2
set notimeout ttimeout ttimeoutlen=200
set splitbelow splitright
set switchbuf=usetab
set lazyredraw
set encoding=utf8
set t_Co=256
set termguicolors
set shortmess=Ia

set relativenumber number
set cursorline scrolloff=6 nowrap
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab textwidth=120
set nohlsearch incsearch ignorecase smartcase showmatch

" show whitespace
set list listchars=nbsp:⦸,extends:»,precedes:«,trail:•,tab:\|-

set statusline=%!MagicStatusLine(1)
set showtabline=2
set tabline=%!MyTabLine()

augroup myFileTypes
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType vim setlocal keywordprg=:help
    autocmd FileType help setlocal keywordprg=:help
    autocmd FileType c,cpp setlocal fdm=syntax
    " Transform path-names for 'gf' in cpp files
    autocmd FileType c,cpp,xml setlocal includeexpr=substitute(v:fname,'%APP%',getcwd(),'g')
    autocmd FileType vim,c,cpp set nofoldenable foldopen=all foldclose=all foldnestmax=10

    autocmd BufReadPost *.log.txt set ft=log
    autocmd BufReadPost fugitive://* setlocal foldopen=

    autocmd BufNewFile,BufReadPost *.tag set ft=javascript.jsx
    autocmd FileType javascript,javascript.jsx,css,less setlocal softtabstop=2 tabstop=2
    autocmd FileType yaml setlocal softtabstop=4 tabstop=4

    autocmd! WinLeave * setlocal nocursorline statusline=%!MagicStatusLine(0)
    autocmd! WinEnter * setlocal cursorline statusline=%!MagicStatusLine(1)
augroup END
"======== [END Settings] ========}}}

"======== [MAPPINGS] ========{{{
" Abbreviations for common flubs
iabbrev ture true
iabbrev flase false
iabbrev fales false
iabbrev teh the

" Vimgrep shorcuts for ds_cinder projects
set grepprg=grep
command! -nargs=1 -complete=buffer VGall exe "noautocmd vimgrep /" . <q-args> . "/j **/* \| copen"
command! -nargs=1 -complete=buffer VGsrc exe "noautocmd vimgrep /" . <q-args> . "/j src/**/* \| copen"
command! -nargs=1 -complete=buffer VGlay exe "noautocmd vimgrep /" . <q-args> . "/j data/layout*/**/* \| copen"
command! -nargs=1 -complete=buffer VGset exe "noautocmd vimgrep /" . <q-args> . "/j settings/**/* \| copen"
command! -nargs=1 -complete=buffer VGcin exe "noautocmd vimgrep /" . <q-args> . "/j ~/Documents/git/ds_cinder_090/**/*.{cpp,h} \| copen"
" Compile for OSX & Windows using MagicJob()
nmap <silent> <leader>b :MCompile DEBUG<cr>
nmap <silent> <leader>B :MCompile RELEASE<cr>
nmap <silent> <leader>r :MCRun<cr>
nmap <silent> <leader>jk :call MagicJobKill()<cr>
" Quickfix / MagicJob output
nmap <leader>z :QfToggle<cr>
nmap <leader>Z :MagicBufferOpen<cr>
nnoremap <silent> <leader>o :MagicOpen<cr>
nnoremap <silent> <leader>O :MagicOpen!<cr>
" Custom operator-pending mappings & pairings
map s <Plug>MagicStamp
nmap S v$h<Plug>MagicStamp
nmap ss V<Plug>MagicStamp

map <leader>y <Plug>MagicClip
nmap <leader>Y v$h<Plug>MagicClip

map <leader>s <Plug>MagicPaste
nmap <leader>S v$h<Plug>MagicPaste
nnoremap <leader>p "*p
nnoremap <leader>P "*P

map <leader>c <Plug>MagicCalc
nmap <leader>C v$h<Plug>MagicCalc

map <leader>ms <Plug>MagicSearch
map <leader>mc <Plug>MagicCinderSearch

augroup DsAutoCmd
    autocmd!
    " Open project in correct dev-env
    if has("mac")
        autocmd FileType c,cpp nnoremap <buffer> <leader>gx :!open xcode/*.xcodeproj"<cr>
    elseif has("win32")
        autocmd FileType c,cpp nnoremap <buffer> <leader>gx :J start devenv<cr>
        autocmd BufReadPost model.yml nnoremap <buffer> <leader>G :!start /Users/luke.purcell/Documents/git/ds_cinder/utility/yaml_importer/yaml_importer.exe %<cr>
    endif
    " Mappings for ease ds_cinder engine resizing
    autocmd BufReadPost engine.xml nnoremap <buffer> <leader>ef :DsFillEngine<cr>
    autocmd BufReadPost engine.xml nnoremap <buffer> <leader>es :DsScaleEngine<cr>
augroup END

"Replacements for vim-unimpaired
nnoremap <silent> coh :set hlsearch!<cr>
nnoremap <silent> cos :set spell!<cr>
nnoremap <silent> cow :CleanWhitespace<cr>
nnoremap cof :w<cr>:CFormat!<cr>:w<cr>

" after c{motion}, <leader>. jumps to next instance of text and replaces
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

" Quickfix next/prev
nnoremap <leader><leader> :cn<cr>
nnoremap <leader>: :cp<cr>

"Yank till EOL
nnoremap Y y$

nnoremap <Leader>w :up<CR>
nnoremap <leader>x :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap - :20Lexplore<cr>

" Splits/Windows/Buffers
nnoremap <leader>v :vs<CR>
nnoremap <leader>V :sp<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap gw <c-w>
nnoremap g= <c-w>=
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap gb :b#<cr>
nnoremap <C-l> gt
nnoremap <C-h> gT

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K as page-up/page-down, orginal functions shadowed on <leader>
nnoremap J 16j
vnoremap J 16j
nnoremap K 16k
vnoremap K 16k
nnoremap <leader>J J
vnoremap <leader>J J
nnoremap <leader>K K
vnoremap <leader>K K

" Insert empty lines on either side of visual selection / current line
nnoremap ;<space> <esc>o<esc>kO<esc>j
vnoremap ;<space> <esc>'>o<esc>'<O<esc>j
"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{
"
" [vim-polyglot] {{{
let g:jsx_ext_required = 1
" [END vim-polyglot] }}}

" [netrw] {{{
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_browsex_viewer="open"
let g:netrw_banner = 0
augroup netrwmaps
    autocmd!
    autocmd FileType netrw nnoremap <buffer> <esc> :bd<cr>
    autocmd FileType netrw setlocal bufhidden=wipe
augroup END
" [END netrw] }}}

" [vim-easy-align] {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
" [END vim-easy-align] }}}

" [Themes] {{{
set background=dark
set termguicolors     " enable true colors support
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
" [END Themes] }}}

" [completor.vim] {{{
let g:completor_completion_delay=40
let g:completor_refresh_always=0

imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
augroup myCompletor
    au!
    au Filetype c,cpp,js,xml,vim imap <buffer> <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
augroup END
" [END completor.vim] }}}

" [vim-airline] {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z=''
let g:airline#extensions#tabline#fnamemod = ':p:t'
" [END vim-airline] }}}

" [vim-rooter] {{{
let g:rooter_change_directory_for_non_project_files = '.'
let g:rooter_targets = '/,*'
" [END vim-rooter] }}}

" [vim-markdown] {{{
augroup markdown
    au!
    autocmd BufNewFile,BufReadPost *.md set ft=markdown
    autocmd BufNewFile,BufReadPost *.md setlocal wrap textwidth=100 linebreak spell nofoldenable
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> j gj
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> k gk
augroup END
" [vim-markdown] }}}

" [vim-projectionist]{{{
let g:projectionist_heuristics = {
      \   "*": {
      \     "src/*.cpp": {
      \        "type": "cpp",
      \        "alternate": "src/{}.h",
      \     },
      \     "src/*.h": {
      \        "type": "hpp",
      \        "alternate": "src/{}.cpp",
      \     },
      \     "data/layouts/*.xml": {
      \        "type": "lay",
      \        "alternate": "src/{}.cpp",
      \     },
      \     "settings/*.xml": {
      \        "type": "set",
      \        "template": ["<interface>","", "</interface>"]
      \     },
      \     "*.sh": {
      \        "type": "script",
      \        "template": ["#!/bin/bash",""]
      \     }
      \   }
      \ }
augroup avimmap
    autocmd!
    " Map split commands
    autocmd FileType c,cpp,xml nmap <buffer> <leader>iv :AV<cr>
    autocmd FileType c,cpp,xml nmap <buffer> <leader>iV :AS<cr>
augroup END
" [vim-projectionist]}}}

" [ctrlp.vim]  {{{
if has("win32")
    let g:ctrlp_map = '<leader>f'
    nmap <silent> <leader>ur :CtrlPMRUFiles<cr>
    nmap <silent> <leader>ub :CtrlPBuffer<cr>

    let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|/private/.*\|\.git/*'
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/](\.(git|hg|svn)|(vs2013|xcode|node_modules))$',
                \ 'file': '\v\.(exe|so|dll)$'
                \ }
    let g:ctrlp_match_window = 'top,order:ttb,min:1,max:16,results:16'
    let g:ctrlp_match_current_file = 1
endif
" [END ctrlp.vim] }}}

" [fzf.vim]  {{{
if has("mac") || has("unix")
    let g:fzf_layout = { 'down': '~40%' }
    let g:fzf_buffers_jump = 1
    nmap <silent> <leader>f :Files<cr>
    nmap <silent> <leader>/ :Lines<cr>
    nmap <silent> <leader>ur :History<cr>
    nmap <silent> <leader>ub :Buffers<cr>
endif
" [fzf.vim] }}}

" [vim-fugitive] & [gist-vim] {{{
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :MagicJob git push<cr>
nmap <leader>gu :MagicJob git pull<cr>
nmap <leader>gb :Gbrowse<cr>
nmap <leader>gB :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :GV<cr>

augroup MyFugitive
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd BufEnter .git/index nmap <buffer> n <c-n>
    autocmd BufEnter .git/index nmap <buffer> p <c-p>
augroup END

let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 0
nmap <leader>Gl :Gist -l<cr>
nmap <leader>Gb :Gist -b<cr>
" [END vim-fugitive] }}}

"======== [END Plugin mappings/settings] ========}}}

"======== [Gvim / MacVim] ========{{{
augroup GuiVim
    au!
    set guioptions=c  "only console prompt, no other ui-chrome
    if has("win32")
        set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI:qDRAFT
        " Fullscreen on app-start
        au GUIEnter * simalt ~x
        au GUIEnter * set visualbell t_vb=
    elseif has("mac")
        set guifont=Hack\ Regular:h12
    endif
augroup END
"======== [END Gvim / MacVim] ========}}}
