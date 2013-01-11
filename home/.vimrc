"Setup for Vundle
""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

""Hey Vundle
Bundle 'gmarik/vundle'

""MINE!
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
"Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'spf13/PIV'
Bundle 'vim-scripts/Puppet-Syntax-Highlighting'
Bundle 'honza/snipmate-snippets'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-cucumber'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'briancollins/vim-jst'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tomtom/tlib_vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'wusher/apidock.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'sjl/gundo.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'bbommarito/vim-slim'
Bundle 'jgdavey/vim-turbux'
Bundle 'benmills/vimux'
Bundle 'sjl/vitality.vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'nono/vim-handlebars'
Bundle 'itspriddle/vim-marked'


filetype plugin indent on


"Color stuff
syntax enable
scriptencoding utf-8
let g:solarized_termcolors=256
set background=dark
color solarized
call togglebg#map("<F1>")

" Random personal settings
set smartindent
set encoding=utf-8
set linespace=0                 " No extra spaces between rows
set backspace=indent,eol,start
set laststatus=2
set t_Co=256
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set shiftwidth=2
set tabstop=2
set softtabstop=2
set incsearch                   " find as you type search
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set hlsearch                    " highlight search terms
set hidden                      " allow buffer switching without saving

" Leader Mapping
let mapleader = ","
nmap <silent> <leader>\ :nohlsearch<CR>
nmap <leader>y :YRShow<cr>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <silent> <leader>tt :TagbarToggle<CR>
map <Leader>rm :Rmodel 
map <Leader>rv :Rview 
map <Leader>rc :Rcontroller 
nmap <Leader>cc :set cc=80<CR>


" Fugitive 
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Marked.app stuff
command! Marked silent !open -a "Marked.app" "%:p"
nmap <silent> <leader>md :Marked<CR>\|:redraw!<CR>

" Vimux stuff
" Prompt for a command to run
 map <Leader>rp :PromptVimTmuxCommand<CR>
" " Run last command executed by RunVimTmuxCommand
 map <Leader>rl :RunLastVimTmuxCommand<CR>
" " Inspect runner pane
 map <Leader>ri :InspectVimTmuxRunner<CR>
" " Close all other tmux panes in current window
 map <Leader>rx :CloseVimTmuxPanes<CR>
" " Interrupt any command running in the runner pane
 map <Leader>rs :InterruptVimTmuxRunner<CR>

" Turbux Window
map <leader>tb :let g:VimuxUseNearestPane = 
" Turbx Mapping
let g:no_turbux_mappings = 1
map <leader>m <Plug>SendTestToTmux
map <leader>M <Plug>SendFocusedTestToTmux
nmap <leader>tn :NeoComplCacheToggle<cr>

"Switch
nnoremap - :Switch<cr>

" PIV 
let g:DisableAutoPHPFolding = 1
let g:PIVAutoClose = 0

" Nerd Tree jazz
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='right'
nmap <Leader>n :NERDTreeTabsToggle<CR>

" Tabularize 
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>

"Some shit for Neocomplcache

" OmniComplete 
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1

" SuperTab like snippets behavior.
imap <silent><expr><TAB> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
      \ "\<C-e>" : "\<TAB>")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

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
let g:neocomplcache_keyword_patterns._ = '\h\w*'

" Plugin key-mappings.
imap <C-a> <Plug>(neosnippet_expand_or_jump)
smap <C-a> <Plug>(neosnippet_expand_or_jump)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-y> neocomplcache#close_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" use honza's snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

if has('conceal')
  set conceallevel=2 concealcursor=i
endif




""Key remaps
let g:ctrlp_map = '<Leader>p'
nnoremap <Leader>b :CtrlPBuffer<CR>
"nnoremap <CR> :noh<CR><CR>
nnoremap ; :
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>l <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Save on focus lost = textmate-stylez
au FocusLost * :wa

" 0
" Font and size
set guifont=Meslo\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'

" When dealing with special file types
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:slime_target = "tmux"

