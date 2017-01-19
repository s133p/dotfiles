set nocompatible
set exrc
set secure

let mapleader=';'
set shellslash

"======== [VUNDLE BEGIN] ========{{{
    filetype off                                  " required
    set rtp+=~/.vim/bundle/Vundle.vim             " required
    call vundle#begin()                           " required
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'tpope/vim-sensible'                   " [vim-sensible]        = Sensible defaults
    Plugin 'tpope/vim-abolish'                    " [vim-abolish]         = Coerce cases
    Plugin 'tpope/vim-surround'                   " [vim-surround]        = Does what it says on the tin
    Plugin 'tpope/vim-repeat'                     " [vim-repeat]          = Allow plugin mappings to be repeated w/ '.'
    Plugin 'michaeljsmith/vim-indent-object'      " [vim-indent-object]   = Use indent levels as text objects
    Plugin 'tomtom/tcomment_vim'                  " [tcomment]            = Shortcuts for commenting
    Plugin 'spiiph/vim-space'                     " [vim-space]           = Use spacebar to repeat last movement
    Plugin 'junegunn/vim-easy-align'              " [vim-easy-align]      = Replacees tabular, includes text-obj mappings
    Plugin 'kshenoy/vim-signature'                " [vim-signature]       = marks in sidebar
    Plugin 'cohama/lexima.vim'                    " [lexima-vim]          = Auto-create pair & jump to end if matching pair typed
    Plugin 'wellle/targets.vim'                   " [targets.vim]         = Adds a beautiful slew of text-objects

    Plugin 'scrooloose/nerdtree'                  " [nerdtree]            = file tree
    Plugin 'Shougo/unite.vim'                     " [unite.vim]           = Fully replaces Ctrl-P & much more
    Plugin 'shougo/neomru.vim'                    " [neomru]              = MRU for unite, replaces startify
    Plugin 'vim-scripts/a.vim'                    " [a.vim]               = Swap between cpp & hpp
    Plugin 'airblade/vim-rooter'                  " [vim-rooter]          = Change directory to root of projects
    Plugin 'tpope/vim-fugitive'                   " [vim-fugitive]        = Git integration

    Plugin 'plasticboy/vim-markdown'              " [vim-markdown]        = markdown highlighting
    Plugin 'vim-scripts/dbext.vim'                " [dbext.vim]           = databases from within vim
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}    " [sparkup]             = shortcut format for generating html/xml

    Plugin 'vim-airline/vim-airline'              " [vim-airline]         = Better tab/status line
    Plugin 'vim-airline/vim-airline-themes'       " [vim-airline-themes]  = Themes for airline
    Plugin 'morhetz/gruvbox'                      " [gruvbox]             = Pretty theme!

    Plugin 's133p/personal-magic.vim'             " [personal-magic.vim]  = A collection of person vim functions

    if has("win32")
        Plugin 'Shougo/neocomplcache.vim'         " [neocomplcache.vim]   = Autocomplete across buffers
        " Plugin 'Shougo/neosnippet'
        " Plugin 'Shougo/neosnippet-snippets'
    elseif has("mac")
        Plugin 'Valloric/YouCompleteMe'           " [YouCompleteMe]       = Clang based completeion
        Plugin 'fatih/vim-go'                     " [vim-go]              = Lots of nice go features
    endif

    call vundle#end()                             " required
    filetype plugin indent on                     " required
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
    set splitbelow
    set splitright
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

    " TESTING!!
    set list                              " show whitespace
    set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                          " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
    set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)

    augroup myfolding
        au!
        autocmd FileType vim setlocal fdm=marker
        autocmd FileType c,cpp setlocal fdm=syntax
        autocmd FileType c,cpp,vim setlocal nofoldenable
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
        "set guifont=Hack\ Regular:h12
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
    endif
"======== [END Gvim / MacVim] ========}}}

"======== [MAPPINGS] ========{{{
    " yank til EOL
    nnoremap Y y$

    " Shorcuts for common actions
    nnoremap <Leader><Leader> ^y$dd:<c-r>0<cr>

    "Replacements for vim-unimpaired
    nnoremap <silent> <leader>o o<esc>k
    nnoremap <silent> <leader>O O<esc>j
    nnoremap <silent> coh :set hlsearch!<cr>
    nnoremap <silent> cos :set spell!<cr>

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
    " Execute current line as Vim EX command
    nnoremap <leader>C ^"cd$dd:<c-r>c<CR>

    " Compile for OSX & Windows using MagicJob()
    augroup MagicCPPCompile
        autocmd!
        autocmd FileType c,cpp nmap <buffer><silent> <leader>b :call MagicCompile(0)<cr>
        autocmd FileType c,cpp nmap <buffer><silent> <leader>B :call MagicCompile(1)<cr>
        autocmd FileType c,cpp nmap <silent> <leader>r :call MagicJob(g:magicToRun, 0)<cr>
        autocmd FileType c,cpp nmap <silent> <leader>ji :call MagicJobInfo()<cr>
        autocmd FileType c,cpp nmap <silent> <leader>jk :call MagicJobKill()<cr>
        autocmd FileType c,cpp nmap <leader>cn :cn<cr>
        autocmd FileType c,cpp nmap <leader>cp :cp<cr>
        " Open project in correct dev-env
        if has("mac")
            autocmd FileType c,cpp nmap <buffer> <leader>cx :call MagicJob("open xcode/*.xcodeproj")<cr>
        elseif has("win32")
            " TODO: Fix this command to open visual studio
            autocmd FileType c,cpp nmap <buffer> <leader>cx :call MagicJob("/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv.exe", 0)<cr>

        endif
    augroup END

    " Custom operator-pending mappings & pairings
    " stamp
    nmap <silent> s :set opfunc=MagicStamp<CR>g@
    vmap <silent> s :<C-U>call MagicStamp(visualmode())<CR>
    nnoremap S v$h"0p
    nnoremap <silent> ss V"0p
    "- 'system-clipboard-yank'
    nmap <silent> <leader>y :set opfunc=MagicClip<CR>g@
    vmap <silent> <leader>y :<C-U>call MagicClip(visualmode())<CR>
    "- 'system-clipboard-paste-stamp'
    nmap <silent> <leader>s :set opfunc=MagicPaste<CR>g@
    vmap <silent> <leader>s :<C-U>call MagicPaste(visualmode())<CR>
    nnoremap <leader>p "*p
    nnoremap <leader>P "*P
    nnoremap <leader>ss V"*P

    " `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
    " Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to work.
    set wildcharm=<c-z>
    cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
    cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

    " Personal notes: Opens unite in g:personal_notes_dir or g:personal_nv_notes_dir
    " based on invocation
    nnoremap <leader>nn :call OpenPersonalNotes('n')<cr>
    nnoremap <leader>nv :vsplit<cr>:vertical resize 100<cr>:call OpenPersonalNotes('n')<cr>
    nnoremap <leader>nV :split<cr>:resize 16<cr>:call OpenPersonalNotes('n')<cr>

    " OSX shortcut to open the pretty-notes
    if has("mac")
        nnoremap <leader>gn :call system("open ~/Dropbox/vim-notes/index.html")<cr>
    endif

    " Quickfix Toggle
    nmap <leader>uf :call QuickfixToggle()<cr>

    " <tab> & <s-tab> : switch tabs if more than one tab is open, otherwise switch splits
    nmap <silent> <tab> :call TabOrSwitch(0)<cr>
    nmap <silent> <s-tab> :call TabOrSwitch(1)<cr>
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
        let g:easy_align_delimiters['r'] = { 'pattern': '=', 'ignore_groups': ['String'], 'left_margin': 2  }
    " [END vim-easy-align] }}}

    " [gruvbox] {{{
        colorscheme gruvbox
        set background=dark
    " [END gruvbox] }}}

    " [nerdtree] {{{
        map <C-n> :NERDTreeToggle<CR>
    " [END nerdtree] }}}

    " [YouCompleteMe] {{{
        if has("mac")
            augroup ycmcpp
                autocmd!
                autocmd FileType c,cpp nmap <buffer> <leader>ct :YcmCompleter GetType<cr>
                autocmd FileType c,cpp nmap <buffer> <leader>cf :YcmCompleter FixIt<cr>
                autocmd FileType c,cpp nmap <buffer> <leader>cd :YcmCompleter GoToDeclaration<cr>
                autocmd FileType c,cpp nmap <buffer> <leader>cD :YcmCompleter GoToDefinition<cr>
            augroup END

            imap <expr> <CR> pumvisible() ? "\<c-y>" : "\<cr>"
            let g:ycm_confirm_extra_conf = 0                              " Don't confirm on load
            let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' " provide some defaults
        endif
    " [END YouCompleteMe] }}}

    " [vim-airline] {{{
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#tabline#show_tabs = 1
        let g:airline#extensions#tabline#show_splits = 1
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
            " On osx-only (until I can get it working under windows):
            " Call MakeHtmlPreview function from personal-magic.vim on each write of
            " personal notes
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
            " autocmd VimEnter * iunmap <leader>ih
            " autocmd VimEnter * iunmap <leader>is
            " autocmd VimEnter * iunmap <leader>ihn
            " Map split commands
            autocmd FileType c,cpp nmap <buffer> <leader>cv :AV<cr>
            autocmd FileType c,cpp nmap <buffer> <leader>cV :AS<cr>
        augroup END
    " [a.vim]}}}

    " [unite.vim] & [unite-qf] {{{
        autocmd FileType unite nmap <buffer> <esc> q
        call unite#filters#matcher_default#use(['matcher_glob'])
        call unite#filters#sorter_default#use(['sorter_selecta'])
        call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(xcode\/build\|\.xcodeproj\|\.DS_Store\|node_modules\|data\/fonts\|data\/images\|DSNode\/node\|install\|vs2013\/Debug\|vs2013\/Release\)')
        nmap <silent> <leader>f :call MyUniteSpecial()<cr>
        nmap <silent> <leader>ur :Unite -no-split -start-insert file_mru<cr>
        nmap <silent> <leader>ub :Unite -no-split buffer<cr>
        nmap <silent> <leader>uB :UniteBookmarkAdd<cr><cr>
        nmap <silent> <leader>ul :Unite locationlist<cr>
        nmap <silent> <leader>us :Unite file_rec -input=src/\  -start-insert -no-split<cr>
        nmap <silent> <leader>uS :Unite file_rec -input=settings/\  -start-insert -no-split<cr>
        nmap <silent> <leader>ud :Unite file_rec -input=data/layout/\  -start-insert -no-split<cr>

        nmap <leader>ug :lvimgrep //j **/*<left><left><left><left><left><left><left>
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
            "autocmd FileType sql nmap > ,sejgjggjVGygk//;<cr>o<esc>kp:DBResultsClose<cr>
            "autocmd FileType sql nmap < ,selgjggjVGygko<esc>kp:DBResultsClose<cr>
        augroup END
    " [dbext.vim]}}}

    " [vim-fugitive] {{{
        nmap <leader>gs :Gstatus<cr>/modified<cr>
        nmap <leader>gc :Gcommit<cr>
        " nmap <leader>gp :Gpush<cr>
        nmap <leader>gp :call MagicJob("git push", 1)<cr>
        nmap <leader>gu :call MagicJob("git pull", 1)<cr>
        nmap <leader>gb :Gbrowse<cr>
        nmap <leader>gB :Gblame<cr>
        nmap <leader>gd :Gdiff<cr>

        " nmap <leader>dg :diffget<cr>
        " nmap <leader>dp :diffput<cr>
        autocmd BufReadPost fugitive://* set bufhidden=delete
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
            let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

            " Define dictionary.
            let g:neocomplcache_dictionary_filetype_lists = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

            " Define keyword.
            if !exists('g:neocomplcache_keyword_patterns')
                let g:neocomplcache_keyword_patterns = {}
            endif
            let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

            " Plugin key-mappings.
            inoremap <expr><C-g>     neocomplcache#undo_completion()
            inoremap <expr><C-l>     neocomplcache#complete_common_string()

            " Recommended key-mappings.
            " <CR>: close popup and save indent.
            inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
            function! s:my_cr_function()
                " return neocomplcache#smart_close_popup() . "\<CR>"
                " For no inserting <CR> key.
                return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
            endfunction
            " <TAB>: completion.
            inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
            " <C-h>, <BS>: close popup and delete backword char.
            inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
            inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
            inoremap <expr><C-y>  neocomplcache#close_popup()
            inoremap <expr><C-e>  neocomplcache#cancel_popup()

            " SNIPS
            " Plugin key-mappings.
            " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
            imap <C-k>     <Plug>(neosnippet_expand_or_jump)
            smap <C-k>     <Plug>(neosnippet_expand_or_jump)
            xmap <C-k>     <Plug>(neosnippet_expand_target)

            " SuperTab like snippets behavior.
            " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
            imap <C-k>     <Plug>(neosnippet_expand_or_jump)
            "imap <expr><TAB>
            " \ pumvisible() ? "\<C-n>" :
            " \ neosnippet#expandable_or_jumpable() ?
            " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
            " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            "     \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        endif
    " [neocomplcache.vim]}}}

    " [sparkup] {{{
        " Use sparkup default mapping <c-e> in normal & insert mode
        let g:sparkupMapsNormal = 1
    " [END sparkup] }}}

"======== [END Plugin mappings/settings] ========}}}
