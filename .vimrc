set nocompatible
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
Plug 'vim-airline/vim-airline'        " [vim-airline]        = Better tab/status line
Plug 'vim-airline/vim-airline-themes' " [vim-airline-themes] = Themes for airline
Plug 'plasticboy/vim-markdown'        " [vim-markdown]       = markdown highlighting
Plug 'sheerun/vim-polyglot'           " [vim-polyglot]       = Better FT/Syntax plugins
Plug 'dzeban/vim-log-syntax'          " [vim-log-syntax]     = Syntax highlighting for log files
Plug 'google/vim-searchindex'         " [vim-searchindex]    = Show current match # + total match count during search

" Themes
Plug 'morhetz/gruvbox'                " [gruvbox]            = Pretty theme!

" Code / Language specific
Plug 'tomtom/tcomment_vim'            " [tcomment]           = Shortcuts for commenting
Plug 'vim-scripts/a.vim'              " [a.vim]              = Swap between cpp & hpp
Plug 'maralla/completor.vim'          " [completor.vim]      = Autocomplete

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

augroup myFileTypes
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType c,cpp setlocal fdm=syntax
    autocmd FileType vim,c,cpp set nofoldenable foldopen=all foldclose=all foldnestmax=10
    autocmd BufNewFile,BufReadPost *.log.txt set ft=log

    autocmd BufReadPost fugitive://* setlocal foldopen=
    autocmd BufNewFile,BufReadPost *.tag set ft=javascript.jsx
    autocmd FileType javascript,javascript.jsx,css,less setlocal tabstop=2
    autocmd FileType yaml setlocal softtabstop=4 tabstop=4 expandtab
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
command! -nargs=1 -complete=buffer VGcin exe "noautocmd vimgrep /" . <q-args> . "/j ~/Documents/git/ds_cinder_090/src/**/* \| copen"

" yank til EOL
nnoremap Y y$
nnoremap - :20Lexplore<cr>

"Replacements for vim-unimpaired
nnoremap <silent> coh :set hlsearch!<cr>
nnoremap <silent> cos :set spell!<cr>
nnoremap <silent> cow :CleanWhitespace<cr>
nnoremap cof :w<cr>:CFormat!<cr>:w<cr>

" after c{motion}, <leader>. jumps to next instance of text and replaces
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>

nnoremap <Leader>w :up<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>q :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Movement between splits/windows/buffers
nnoremap gw <c-w>
nnoremap g= <c-w>=
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap gb :b#<cr>
nnoremap <C-t> gt

" create splits/tabs
nnoremap <leader>v :vs<CR>
nnoremap <leader>V :sp<CR>
nnoremap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K as page-up/page-down, orginal functions shadowed on <leader>
nnoremap J 16j
vnoremap J 16j
nnoremap K 16k
vnoremap K 16k
nnoremap <leader>J J
nnoremap <leader>K K

" Windows convienence for making local visual studio solution
function! MakeLocalSln()
    let projName = (split(getcwd(), '/')[-1])
    let currsln = "vs2013/" . projName . ".sln"
    silent exec "vs " . currsln
    silent exec "sav vs2013/local.sln"
    silent exec 'g/%/norm! f%xct%=$"lx'
    silent exec 'write'
endfunction

nmap <silent> <leader>gf :EFile<cr>
nmap <silent> <leader>gv :VFile<cr>

" Insert empty lines on either side of visual selection / current line
nnoremap ;<space> <esc>o<esc>kO<esc>j
vnoremap ;<space> <esc>'>o<esc>'<O<esc>j

" Compile for OSX & Windows using MagicJob()
nmap <silent> <leader>b :MCompile DEBUG<cr>
nmap <silent> <leader>B :MCompile RELEASE<cr>
nmap <silent> <leader>r :MCRun<cr>
nmap <silent> <leader>jk :call MagicJobKill()<cr>
augroup MagicCPPCompile
    autocmd!
    " Open project in correct dev-env
    if has("mac")
        autocmd FileType c,cpp nnoremap <buffer> <leader>gx :call MagicJob("open xcode/*.xcodeproj", 0)<cr>
    elseif has("win32")
        autocmd FileType c,cpp nnoremap <buffer> <leader>gx :call MagicJob("start devenv", 0)<cr>
        autocmd BufReadPost model.yml nnoremap <buffer> <leader>G :!start /Users/luke.purcell/Documents/git/ds_cinder/utility/yaml_importer/yaml_importer.exe %<cr>

        autocmd BufReadPost engine.xml nnoremap <buffer> <leader>ef :DstFConifg<cr>
        autocmd BufReadPost engine.xml nnoremap <buffer> <leader>es :DstSConifg<cr>
        command! MakeSln call MakeLocalSln()
    endif
augroup END

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
nmap <leader>mS v$h<Plug>MagicSearch

map <leader>mc <Plug>MagicCinderSearch
nmap <leader>mC v$h<Plug>MagicCinderSearch

" Quickfix / MagicJob output
nmap <leader>z :QfToggle<cr>
nmap <leader>Z :call MagicBufferOpen()<cr>

" Open cwd or file directory
if has("mac")
    nnoremap <silent> <leader>o :J open .<cr>
    nnoremap <silent> <leader>O :J open <c-r>=expand("%:p:h")<cr><cr>
elseif has("win32")
    nnoremap <silent> <leader>o :J start explorer .<cr>
    nnoremap <silent> <leader>O :J start explorer "<c-r>=substitute(expand("%:p:h"), '/', '\', 'g')<cr>"<cr>
endif

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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <buffer> <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
augroup myCompletor
    au!
    au Filetype c,cpp,js,xml,vim inoremap <buffer> <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
augroup END
let g:completor_completion_delay=40
let g:completor_refresh_always=0
" [END completor.vim] }}}

" [vim-airline] {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z=''
let g:airline#extensions#tabline#fnamemod = ':p:t'
" [END vim-airline] }}}

" [vim-rooter] (auto cd to project roots) {{{
let g:rooter_change_directory_for_non_project_files = '.'
let g:rooter_targets = '/,*'
" [END vim-rooter] (auto cd to project roots) }}}

" [vim-markdown] {{{
augroup markdown
    au!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufReadPost *.md setlocal wrap textwidth=100
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> j gj
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> k gk
    autocmd BufNewFile,BufReadPost *.md setlocal linebreak spell nofoldenable
augroup END
" [vim-markdown] }}}

" [a.vim]{{{
augroup avimmap
    autocmd!
    " Unmap insert mode mappings
    autocmd VimEnter * iunmap <leader>ih
    autocmd VimEnter * iunmap <leader>is
    autocmd VimEnter * iunmap <leader>ihn
    " Map split commands
    autocmd FileType c,cpp nmap <buffer> <leader>iv :AV<cr>
    autocmd FileType c,cpp nmap <buffer> <leader>iV :AS<cr>
augroup END
" [a.vim]}}}

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
    " [END ctrlp.vim] }}}
endif

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
