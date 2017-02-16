set nocompatible
"set exrc
set secure

set shellslash
let mapleader=';'

"======== [PLUGINS BEGIN] ========{{{
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-sensible'                " [vim-sensible]       = Sensible defaults
Plug 'tpope/vim-abolish'                 " [vim-abolish]        = Coerce cases
Plug 'tpope/vim-surround'                " [vim-surround]       = Does what it says on the tin
Plug 'tpope/vim-repeat'                  " [vim-repeat]         = Allow plugin mappings to be repeated w/ '.'
Plug 'tpope/vim-fugitive'                " [vim-fugitive]       = Git integration
Plug 'airblade/vim-rooter'               " [vim-rooter]         = Change directory to root of projects

Plug 'spiiph/vim-space'                  " [vim-space]          = Use spacebar to repeat last movement
Plug 'michaeljsmith/vim-indent-object'   " [vim-indent-object]  = Use indent levels as text objects
Plug 'cohama/lexima.vim'                 " [lexima-vim]         = Auto-create pair & jump to end if matching pair typed
Plug 'wellle/targets.vim'                " [targets.vim]        = Adds a beautiful slew of text-objects
Plug 'junegunn/vim-easy-align'           " [vim-easy-align]     = Replacees tabular, includes text-obj mappings

" Quick file navigation
Plug 'Shougo/unite.vim'                  " [unite.vim]          = Fully replaces Ctrl-P & much more
Plug 'shougo/neomru.vim'                 " [neomru]             = MRU for unite

" Syntax & Visual
Plug 'vim-airline/vim-airline'           " [vim-airline]        = Better tab/status line
Plug 'vim-airline/vim-airline-themes'    " [vim-airline-themes] = Themes for airline
Plug 'morhetz/gruvbox'                   " [gruvbox]            = Pretty theme!
Plug 'plasticboy/vim-markdown'           " [vim-markdown]       = markdown highlighting
Plug 'rstacruz/sparkup', {'rtp': 'vim/'} " [sparkup]            = shortcut format for generating html/xml
Plug 'sheerun/vim-polyglot'              " [vim-polyglot]       = Better FT/Syntax plugins
Plug 'dzeban/vim-log-syntax'             " [vim-log-syntax]     = Syntax highlighting for log files

" Code / Language specific
Plug 'tomtom/tcomment_vim'               " [tcomment]           = Shortcuts for commenting
Plug 'vim-scripts/dbext.vim'             " [dbext.vim]          = databases from within vim
Plug 'vim-scripts/a.vim'                 " [a.vim]              = Swap between cpp & hpp
Plug 'maralla/completor.vim'             " [completor.vim]      = Autocomplete
if has("mac")
 Plug 'fatih/vim-go'                     " [vim-go]             = Lots of nice go features
endif

" Personal functions
Plug 's133p/personal-magic.vim'          " [personal-magic.vim] = A collection of person vim functions
call plug#end()
"======== [PLUGINS END] ========}}}

"======== [Settings] ========{{{
filetype indent plugin on
syntax on
set hidden noswapfile
set showcmd confirm cmdheight=2
set nostartofline
set novisualbell t_vb=
set mouse=a
set backspace=2
set notimeout ttimeout ttimeoutlen=200
set splitbelow splitright
set switchbuf=usetab
set lazyredraw
set encoding=utf8
set t_Co=256
set shortmess=Ia

set relativenumber number
set cursorline
set scrolloff=6
set nowrap
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
set nohlsearch incsearch ignorecase smartcase showmatch

" show whitespace
set list listchars=nbsp:⦸,extends:»,precedes:«,trail:•,tab:▷┅

augroup myfolding
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType c,cpp setlocal fdm=syntax
    set nofoldenable foldopen=all foldclose=all foldnestmax=2

    autocmd BufReadPost fugitive://* set foldopen=
    autocmd BufDelete fugitive://* set foldopen=all
augroup END
"======== [END Settings] ========}}}

"======== [MAPPINGS] ========{{{
" Abbreviations for common flubs
iabbrev ture true
iabbrev flase false
iabbrev teh the

" Useful Commands
command! -nargs=1 -complete=buffer VGall exe "vimgrep /" . <q-args> . "/j **/* \| copen"
command! -nargs=1 -complete=buffer VGsrc exe "vimgrep /" . <q-args> . "/j src/**/* \| copen"
command! -nargs=1 -complete=buffer VGother echo "vimgrep /" . <q-args> . "/j data/layout/**/* settings/**/* \| copen"

" yank til EOL
nnoremap Y y$
nnoremap <leader><leader> q:
nnoremap - :20Lexplore<cr>

"Replacements for vim-unimpaired
nnoremap <silent> <leader>o o<esc>k
nnoremap <silent> <leader>O O<esc>j
nnoremap <silent> coh :set hlsearch!<cr>
nnoremap <silent> cos :set spell!<cr>
nnoremap <silent> cow :CleanWhitespace<cr>
nnoremap col :call ListTabToggle()<cr>

nnoremap <Leader>w :w<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>q :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Movement between splits/windows/buffers
nnoremap gw <c-w>
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap gb :b#<cr>

" create splits/tabs
nnoremap <leader>v :vs<CR>
nnoremap <leader>V :sp<CR>
nnoremap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K as page-up/page-down, orginal functions shadowed on <leader>
nnoremap J <c-d>
vnoremap J <c-d>
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap <leader>J J
nnoremap <leader>K K

" replace visual selection w/ <c-r>= itself; Mnemonic: calc
vmap <leader>c c<c-r>=<c-r>"<cr><esc>
map <leader>C <Plug>MagicCalc

" Compile for OSX & Windows using MagicJob()
augroup MagicCPPCompile
    autocmd!
    autocmd FileType c,cpp nmap <buffer><silent> <leader>b :call MagicCompile(0)<cr>
    autocmd FileType c,cpp nmap <buffer><silent> <leader>B :call MagicCompile(1)<cr>
    autocmd FileType c,cpp nmap <silent> <leader>r :call MagicCompileRun()<cr>
    autocmd FileType c,cpp nmap <silent> <leader>ji :call MagicJobInfo()<cr>
    autocmd FileType c,cpp nmap <silent> <leader>jk :call MagicJobKill()<cr>
    " Reformat code
    autocmd FileType c,cpp,js nmap <buffer><silent> <leader>R :CFormat<cr>
    " Open project in correct dev-env
    if has("mac")
        autocmd FileType c,cpp nmap <buffer> <leader>gx :call MagicJob("open xcode/*.xcodeproj", 0)<cr>
    elseif has("win32")
        autocmd FileType c,cpp nmap <buffer> <leader>gx :call MagicJob("/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv.exe", 0)<cr>
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

" Personal notes: Opens unite in g:personal_notes_dir or g:personal_nv_notes_dir based on invocation
nnoremap <leader>nn :call OpenPersonalNotes('n')<cr>
nnoremap <leader>nv :vsplit<cr>:vertical resize 100<cr>:call OpenPersonalNotes('n')<cr>
nnoremap <leader>nV :split<cr>:resize 16<cr>:call OpenPersonalNotes('n')<cr>

" OSX shortcut to open the pretty-notes
if has("mac")
    nnoremap <leader>gn :call system("open ~/Dropbox/vim-notes/index.html")<cr>
endif

" Quickfix
nnoremap cn :cn<cr>
nnoremap cp :cp<cr>
nmap <leader>z :call QuickfixToggle()<cr>
nmap <leader>Z :call MagicBufferOpen()<cr>

"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

" [vim-polyglot] {{{
let g:jsx_ext_required = 1
" [END vim-polyglot] }}}

" [netrw] {{{
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif

" Personal delimiters:
" i-'initilizer list' f-'function prototypes'  v-'variable definions'
let g:easy_align_delimiters['i'] = { 'pattern': '\(:\|,\) .\+', 'delimiter_align': 'l', 'left_margin': 2  }
let g:easy_align_delimiters['f'] = { 'pattern': '[a-z:_-]\+(.\{-})\(;\|.\+}\)$', 'delimiter_align': 'l', 'left_margin': 2  }
let g:easy_align_delimiters['v'] = { 'pattern': '\S\+;$', 'delimiter_align': 'l', 'left_margin': 2  }
" [END vim-easy-align] }}}

" [gruvbox] {{{
colorscheme gruvbox
set background=dark
" [END gruvbox] }}}

" [completor.vim] {{{
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:completor_completion_delay=20
if has("mac")
    " let g:completor_clang_binary = '/Library/Developer/CommandLineTools/usr/bin/clang'
    let g:completor_gocode_binary = '/Users/lukepurcell/Documents/goproj/bin/gocode'
    let g:completor_node_binary = '/usr/local/bin/node'
elseif has("win32")
    let g:completor_clang_binary = 'clang'
endif
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
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_targets = '/,*'
" [END vim-rooter] (auto cd to project roots) }}}

" [vim-markdown] {{{
augroup markdown
    au!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufReadPost *.md setlocal wrap
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> j gj
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> k gk
    autocmd BufNewFile,BufReadPost *.md setlocal linebreak
    autocmd BufEnter,BufnewFile *.md setlocal spell
    autocmd FileType markdown setlocal nofoldenable

    " Add another todo item
    autocmd FileType markdown nnoremap <buffer> <leader>a A<cr>**[ ]**<space>
    " Swap [ X ] and [ _ ] with space
    autocmd FileType markdown nnoremap <buffer> <silent> <leader><space> mz:.g/\[+\]/s/\[+\]/[*]/<cr>:.g/\[ \]/s/\[ \]/[+]/<cr>:.g/\[\*\]/s/\[\*\]/[ ]/<cr>`z:delmarks!<cr>
    " Call MakeHtmlPreview function from personal-magic.vim
    if has("mac")
        autocmd BufWritePost ~/Dropbox/vim-notes/*.md silent call MakeHtmlPreview()
    endif
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

" [unite.vim]  {{{
autocmd FileType unite nmap <buffer> <esc> q
call unite#filters#matcher_default#use(['matcher_glob'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(xcode\/build\|\.xcodeproj\|\.DS_Store\|node_modules\|data\/fonts\|data\/images\|DSNode\/node\|install\|vs2013\/Debug\|vs2013\/Release\)')
nmap <silent> <leader>f :call MyUniteSpecial()<cr>
nmap <silent> <leader>ur :Unite -no-split -start-insert file_mru<cr>
nmap <silent> <leader>ub :Unite -no-split buffer<cr>
" [END unite.vim] }}}

" [dbext.vim]{{{
augroup sqldb
    autocmd!
    if has("mac")
        let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite'
    elseif has("win32")
        let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite:bin_path=/Users/luke.purcell/Desktop/Misc/sqlite'
    endif
    autocmd FileType sql DBSetOption profile=mySqlite
augroup END
" [dbext.vim]}}}

" [vim-fugitive] {{{
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :MagicJob! git push<cr>
nmap <leader>gu :MagicJob! git pull<cr>
nmap <leader>gb :Gbrowse<cr>
vmap <leader>gb :Gbrowse<cr>
nmap <leader>gB :Gblame<cr>
nmap <leader>gd :Gdiff<cr>

augroup MyFugitive
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd BufEnter .git/index nmap <buffer> n <c-n>
    autocmd BufEnter .git/index nmap <buffer> p <c-p>
augroup END
" [END vim-fugitive] }}}

"======== [END Plugin mappings/settings] ========}}}

"======== [Gvim / MacVim] ========{{{
augroup GuiVim
    au!
    if has("win32")
        set guioptions=c  "only console prompt, no other ui-chrome
        set guifont=Sauce_Code_powerline:h10:cANSI:qDRAFT
        " Fullscreen on app-start
        au GUIEnter * simalt ~x
        au GUIEnter * set visualbell t_vb=
    elseif has("mac")
        set guioptions=c  "only console prompt, no other ui-chrome
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
    endif
augroup END
"======== [END Gvim / MacVim] ========}}}
