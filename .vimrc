set nocompatible
"set exrc
set secure

let mapleader=';'
set shellslash

"======== [VUNDLE BEGIN] ========{{{
filetype off                                " required
set rtp+=~/.vim/bundle/Vundle.vim           " required
call vundle#begin()                         " required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'                 " [vim-sensible]        = Sensible defaults
Plugin 'tpope/vim-abolish'                  " [vim-abolish]         = Coerce cases
Plugin 'tpope/vim-surround'                 " [vim-surround]        = Does what it says on the tin
Plugin 'tpope/vim-repeat'                   " [vim-repeat]          = Allow plugin mappings to be repeated w/ '.'
Plugin 'michaeljsmith/vim-indent-object'    " [vim-indent-object]   = Use indent levels as text objects
Plugin 'tomtom/tcomment_vim'                " [tcomment]            = Shortcuts for commenting
Plugin 'spiiph/vim-space'                   " [vim-space]           = Use spacebar to repeat last movement
Plugin 'junegunn/vim-easy-align'            " [vim-easy-align]      = Replacees tabular, includes text-obj mappings
Plugin 'cohama/lexima.vim'                  " [lexima-vim]          = Auto-create pair & jump to end if matching pair typed
Plugin 'wellle/targets.vim'                 " [targets.vim]         = Adds a beautiful slew of text-objects
Plugin 'octol/vim-cpp-enhanced-highlight'   " [vim-cpp-highlight]   = Better highlighting for c++

Plugin 'Shougo/unite.vim'                   " [unite.vim]           = Fully replaces Ctrl-P & much more
Plugin 'shougo/neomru.vim'                  " [neomru]              = MRU for unite
Plugin 'vim-scripts/a.vim'                  " [a.vim]               = Swap between cpp & hpp
Plugin 'airblade/vim-rooter'                " [vim-rooter]          = Change directory to root of projects
Plugin 'tpope/vim-fugitive'                 " [vim-fugitive]        = Git integration

Plugin 'plasticboy/vim-markdown'            " [vim-markdown]        = markdown highlighting
Plugin 'vim-scripts/dbext.vim'              " [dbext.vim]           = databases from within vim
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " [sparkup]             = shortcut format for generating html/xml

Plugin 'vim-airline/vim-airline'            " [vim-airline]         = Better tab/status line
Plugin 'vim-airline/vim-airline-themes'     " [vim-airline-themes]  = Themes for airline
Plugin 'morhetz/gruvbox'                    " [gruvbox]             = Pretty theme!

Plugin 's133p/personal-magic.vim'           " [personal-magic.vim]  = A collection of person vim functions

if has("win32")
    Plugin 'Shougo/neocomplcache.vim'       " [neocomplcache.vim]   = Autocomplete across buffers
elseif has("mac")
    Plugin 'Valloric/YouCompleteMe'         " [YouCompleteMe]       = Clang based completeion
    Plugin 'fatih/vim-go'                   " [vim-go]              = Lots of nice go features
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
endif

call vundle#end()                           " required
filetype plugin indent on                   " required
"======== [VUNDLE END] ========}}}

"======== [Settings] ========{{{
filetype indent plugin on
syntax on
set hidden
set showcmd
set nohlsearch
set nostartofline
set confirm
set novisualbell
set t_vb=
set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set relativenumber
set number
set cul
set scrolloff=6
set splitbelow splitright
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set noswapfile
set nowrap
set lazyredraw
set encoding=utf8
set t_Co=256
set switchbuf=usetab
set shortmess=Ia
set incsearch
set ignorecase
set smartcase
set showmatch

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
" + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)


" Disables cursorline for inactive windows
augroup cline
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

augroup myfolding
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType c,cpp setlocal fdm=syntax
    set nofoldenable foldopen=all foldclose=all foldnestmax=2

    autocmd BufReadPost fugitive://* set foldopen=
    autocmd BufDelete fugitive://* set foldopen=all
augroup END
"======== [END Settings] ========}}}

"======== [Gvim / MacVim] ========{{{
if has("win32")
    set guioptions=c  "only console prompt, no other ui-chrome
    set guifont=Sauce_Code_powerline:h10:cANSI:qDRAFT
    " Fullscreen on app-start
    au GUIEnter * simalt ~x
elseif has("mac")
    set guioptions=c  "only console prompt, no other ui-chrome
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
endif
"======== [END Gvim / MacVim] ========}}}

"======== [MAPPINGS] ========{{{
" yank til EOL
nnoremap Y y$

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
" this, is a, 5000, seperated list, of things "
" Compile for OSX & Windows using MagicJob()
augroup MagicCPPCompile
    autocmd!
    autocmd FileType c,cpp nmap <buffer><silent> <leader>b :call MagicCompile(0)<cr>
    autocmd FileType c,cpp nmap <buffer><silent> <leader>B :call MagicCompile(1)<cr>
    autocmd FileType c,cpp nmap <silent> <leader>r :call MagicCompileRun()<cr>
    autocmd FileType c,cpp nmap <silent> <leader>R :call MagicCompileRun(1)<cr>
    autocmd FileType c,cpp nmap <silent> <leader>ji :call MagicJobInfo()<cr>
    autocmd FileType c,cpp nmap <silent> <leader>jk :call MagicJobKill()<cr>
    " Open project in correct dev-env
    if has("mac")
        autocmd FileType c,cpp nmap <buffer> <leader>gx :call MagicJob("open xcode/*.xcodeproj", 0)<cr>
    elseif has("win32")
        autocmd FileType c,cpp nmap <buffer> <leader>gx :call MagicJob("/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv.exe", 0)<cr>
    endif
augroup END

" Custom operator-pending mappings & pairings stamp
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

" " <tab> & <s-tab> : switch tabs if more than one tab is open, otherwise switch splits
" augroup magictab
"     autocmd!
"     autocmd VimEnter * nnoremap <silent> <tab> :call TabOrSwitch(0)<cr>
"     autocmd VimEnter * nnoremap <silent> <s-tab> :call TabOrSwitch(1)<cr>
" augroup END

"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

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

" [YouCompleteMe] {{{
if has("mac")
    augroup ycmcpp
        autocmd!
        autocmd FileType c,cpp nmap <buffer> <leader>it :YcmCompleter GetType<cr>
        autocmd FileType c,cpp nmap <buffer> <leader>if :YcmCompleter FixIt<cr>
    augroup END

    imap <expr> <CR> pumvisible() ? "\<c-y>" : "\<cr>"
    let g:ycm_confirm_extra_conf = 0                              " Don't confirm on load
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' " provide some defaults
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_filepath_completion_use_working_dir = 1
endif
" [END YouCompleteMe] }}}

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
let g:vim_markdown_fenced_languages = ['c=c']
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
augroup mkdownNotes
    au!
    " Call MakeHtmlPreview function from personal-magic.vim
    if has("mac")
        autocmd BufWritePost ~/Dropbox/vim-notes/*.md silent call MakeHtmlPreview()
    endif
augroup END
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
nmap <silent> <leader>us :Unite file_rec -input=src/\  -start-insert -no-split<cr>
nmap <silent> <leader>uS :Unite file_rec -input=settings/\  -start-insert -no-split<cr>
nmap <silent> <leader>ul :Unite file_rec -input=data/layout/\  -start-insert -no-split<cr>

nmap <leader>ug :vimgrep //j src/**/*<left><left><left><left><left><left><left><left><left><left><left>
" [END unite.vim] }}}

" [dbext.vim]{{{
if has("mac")
    let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite'
elseif has("win32")
    let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite:bin_path=/Users/luke.purcell/Desktop/Misc/sqlite'
endif
augroup sqldb
    autocmd!
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

" [neocomplcache.vim]{{{
if has("win32")
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " <CR>: close popup and save indent.
    inoremap <expr> <CR> pumvisible() ? neocomplcache#close_popup() : "\<cr>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
endif
" [neocomplcache.vim]}}}

" [sparkup] {{{
" Use sparkup default mapping <c-e> in normal & insert mode
let g:sparkupMapsNormal = 1
" [END sparkup] }}}

"======== [END Plugin mappings/settings] ========}}}
