"Setup for Plugin Manager
""
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

set encoding=utf-8
scriptencoding utf-8
set shell=/bin/bash

""Plugs
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'benekastah/neomake'
Plug 'justinmk/vim-sneak'
Plug 'Yggdroot/indentLine'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'b3niup/numbers.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-dispatch'
Plug 'fatih/vim-go', { 'for': 'go'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'editorconfig/editorconfig-vim'
Plug 'wellle/tmux-complete.vim'
Plug 'kassio/neoterm'
Plug 'luochen1990/rainbow'
Plug 'itspriddle/vim-marked'
Plug 'christoomey/vim-tmux-runner'
Plug 'sheerun/vim-polyglot'

""Will you make the cut
Plug 'AndrewRadev/splitjoin.vim'
Plug 'malkomalko/projections.vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tommcdo/vim-lion'
Plug 'elmcast/elm-vim', { 'for': 'elm' }

""Additional syntax
Plug 'posva/vim-vue', { 'for': 'vue' }


""Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'osyo-manga/unite-quickfix'
Plug 'critiqjo/unite-fasd.vim'
Plug 'rhysd/unite-redpen.vim', { 'for': 'liquid' }
Plug 'Shougo/vimfiler.vim'

""Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

call plug#end()            " required
filetype plugin indent on

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ], [ 'fugitive', 'filename'  ] ],
      \   'right': [ [ 'lineinfo'  ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype'  ]  ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|'  }
      \ }


function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:rainbow_active = 1

"Color stuff
syntax enable
" let g:solarized_termtrans = 1
let g:gruvbox_termcolors=16
set background=dark
colorscheme gruvbox
set clipboard=unnamed

" Random personal settings
set smartindent
set linespace=0                 " No extra spaces between rows
set backspace=indent,eol,start
set laststatus=2
set t_Co=256
set showmode
set showcmd
set hidden
set visualbell
set number
set cursorline
set ttyfast
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set incsearch                   " find as you type search
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set hlsearch                    " highlight search terms
set hidden                      " allow buffer switching without saving
set nobackup
set nowb
set noswapfile
set wildmenu
set wildmode=longest:full,full
set synmaxcol=200
set nrformats=
set splitbelow
set splitright
set nowrap
set ttimeoutlen=100
set complete+=kspell
let g:python3_host_prog = '/usr/local/bin/python3'

"Yank into OS X, might require reattach-to-user clipboard"
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentations from pasteboard
noremap <leader>P :set paste<CR>:put  *<CR>:set nopaste<CR>

" Leader Mapping
let mapleader = "\<Space>"

nnoremap <Leader>rm :Rmodel
nnoremap <Leader>rv :Rview
nnoremap <Leader>rc :Rcontroller
nnoremap <Leader>sl :set cc=80<CR>
nnoremap <leader>tw :set textwidth=80<cr>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"Fugitive bindings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite!<CR>

"Indent Lines
hi Conceal ctermfg=red ctermbg=NONE

tnoremap <Leader><ESC> <C-\><C-n>

" Testing

let test#strategy = "vtr"
nmap <silent> ,t :TestFile<CR>

"Switch
nnoremap - :Switch<cr>

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"TmuxLine settings
let g:tmuxline_preset = {
      \'a' : '#S',
      \'b' : '#(whoami)',
      \'c' : '#(~/src/battery Discharging)',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'z' : '#(tmux-mem-cpu-load 2)',}

""Key remaps
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
inoremap jj <ESC>

" When dealing with special file types
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.rabl set ft=ruby

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType markdown let b:dispatch = 'octodown %'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers  = ['rubocop', 'mri']

"Unite
nnoremap <Leader>p :Unite buffer file_rec/async:!<cr>
nnoremap <Leader>/ :Unite grep<cr>
nnoremap <Leader>s :Unite -quick-match buffer<cr>
nnoremap <Leader>o :Unite -vertical -winwidth=35 outline<cr>
nnoremap <Leader>qf :Unite -no-quit -direction=botright quickfix<cr>
nnoremap <Leader>ll :Unite -no-quit -direction=botright location_list<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('grep', 'ignore_globs', ['./.git/*', './.bundle/*', './node_modules/**', './app/bower_components/**', './app/images/**', './dist/**'])
call unite#custom#source('file_rec/async', 'ignore_globs', ['./.git/**', './.bundle/**', './node_modules/**', './app/bower_components/**', './app/images/**', './dist/**'])
let g:unite_fasd#fasd_path = '/usr/local/bin/fasd'
let g:unite_source_history_yank_enable = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_prompt = "➤ "
let g:unite_source_rec_async_command =
  \ ['ag', '--follow', '--nocolor', '--nogroup',
  \  '--hidden', '-g', '']
let g:vimfiler_as_default_explorer = 1

call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })

autocmd! BufWritePost * Neomake

" hide/close terminal
nnoremap <silent> ,tc :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tk :call neoterm#kill()<cr>

" Tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nmap <silent> ,vk :VtrKillRunner<CR>

if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

"Ctags
let g:easytags_auto_highlight = 0
let g:easytags_on_cursorhold = 0 " disabled because it causes a recursive tag generation
let g:easytags_dynamic_files = 0
let g:easytags_suppress_ctags_warning = 1
set cpoptions+=d

"Unite Grep
let g:unite_source_grep_max_candidates = 200
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt in unite grep source.
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
        \ '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts =
        \ '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R %"
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open %:p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
 " For terminal Vim not to look messed up.
 redraw!
endfunction command! Reveal call <SID>RevealInFinder()
