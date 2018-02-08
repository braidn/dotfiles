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
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
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
Plug 'jsfaint/gen_tags.vim'
Plug 'othree/jspc.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

""Will you make the cut
Plug 'AndrewRadev/splitjoin.vim'
Plug 'malkomalko/projections.vim'
Plug 'xolox/vim-misc'
Plug 'tommcdo/vim-lion'
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'reasonml-editor/vim-reason-plus'

"" Deoplete
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mhartington/deoplete-typescript', { 'for': 'typescript' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'erubis'] }

Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript', 'for': 'typescript' }
Plug 'ujihisa/neco-look', { 'for': ['gitcommit', 'markdown'] }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()            " required
filetype plugin indent on

if exists('g:loaded_lightline')
  call denite#custom#option('default', 'statusline', v:true)
endif

let g:lightline = {
      \ 'colorscheme': 'powerline',
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
  return fname == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '' 
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
        \ &ft == 'denite' ? 'Denite' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

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
let g:sneak#s_next = 1

"Netrw
let g:netrw_liststyle=3
let g:netrw_chgwin=2
let g:netrw_winsize=22
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

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
nnoremap <leader>twd :let g:test#transformation = 'docker'<cr>

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
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
function! DockerTransform(cmd) abort
  return 'dcr test '.a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#strategy = 'vtr'

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
inoremap jj <ESC>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" FT Specific
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.rabl set ft=ruby

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType markdown let b:dispatch = 'octodown %'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:elm_format_autosave = 1
let g:elm_make_output_file = "./dist/elm.js"
let g:elm_make_show_warnings = 0

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers  = ['rubocop', 'mri']
let g:neomake_slim_enabled_makers  = ['slimlint']

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#sources#tss#javascript_support = 1
let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ ]
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources = {}
let g:deoplete#sources.markdown = ['buffer', 'look']
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ruby = ['look']
if !exists('g:deoplete#omni#functions')
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
  let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
  let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'
  let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
  let g:deoplete#omni#functions.eruby = 'rubycomplete#Complete'
  let g:deoplete#omni#functions.javascript = 'jspc#omni'
  let g:deoplete#omni#functions.jsx = 'jspc#omni'
  if exists('g:plugs["tern_for_vim"]')
    let g:tern_request_timeout = 1
    let g:tern_request_timeout = 6000
    let g:tern#command = ["tern"]
    let g:tern#arguments = ["--persistent"]
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    let g:deoplete#omni#functions.javascript = ['tern#Complete','jspc#omni']
    let g:deoplete#omni#functions.jsx = ['tern#Complete','jspc#omni']
  endif
endif
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"JS
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \'noremap')

nnoremap <leader>p :<C-u>Denite file_rec -mode=normal<CR>
nnoremap <leader>s :<C-u>Denite buffer -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader># :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

hi link deniteMatchedChar Special

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

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

nnoremap <silent> lch :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> lcd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> lcr :call LanguageClient_textDocument_rename()<CR>

if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
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
