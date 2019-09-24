"Setup for Plugin Manager
""
set nocompatible

call plug#begin('~/.vim/plugged')

set encoding=utf-8
scriptencoding utf-8
set shell=/bin/bash

""Plugs
Plug 'cocopon/iceberg.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'justinmk/vim-sneak'
Plug 'Yggdroot/indentLine'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'b3niup/numbers.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-dispatch'
Plug 'fatih/vim-go', { 'for': 'go'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'editorconfig/editorconfig-vim'
Plug 'wellle/tmux-complete.vim'
Plug 'luochen1990/rainbow'
Plug 'itspriddle/vim-marked'
Plug 'christoomey/vim-tmux-runner'
Plug 'sheerun/vim-polyglot'
Plug 'othree/jspc.vim'
Plug 'airblade/vim-rooter'
Plug 'honza/vim-snippets'
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'kballard/vim-swift', { 'for': 'swift' }
Plug 'dafufer/nvim-cm-swift-completer', { 'for': 'swift' }
Plug 'burner/vim-svelte', { 'for': 'svelte' }



""Will you make the cut
Plug 'malkomalko/projections.vim'
Plug 'rbong/vim-flog'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'jparise/vim-graphql'
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'w0rp/ale'
Plug 'othree/csscomplete.vim'
Plug 'othree/html5.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'othree/jspc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asyncrun.vim'
Plug 'rizzatti/dash.vim'

call plug#end()            " required
filetype plugin indent on
runtime macros/sandwich/keymap/surround.vim

let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'cocstatus'  ], [ 'gitstatus', 'filename'  ] ],
      \   'right': [ [ 'lineinfo'  ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype'  ]  ]
      \ },
      \ 'component_function': {
      \   'gitstatus': 'MyGitstatus',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'cocstatus': 'coc#status',
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

function! MyGitstatus()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler'
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

function! MySearch()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ &ft == 'fzf' ? 'MySearch' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:rainbow_active = 1

if executable('ag')
  set grepprg=rg
  set grepformat=%f:%l:%c%m
endif

set grepprg=rg\ --vimgrep

"Color stuff
syntax enable
" let g:solarized_termtrans = 1
" let g:gruvbox_termcolors=16
set background=dark
" colorscheme gruvbox
colorscheme iceberg
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
let g:netrw_localrmdir='rm -r'

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
nnoremap <leader>ft :Neoformat<cr>

" Vim Diff
map <silent> <leader>2 :diffget 2<CR>
map <silent> <leader>3 :diffget 3<CR>
map <silent> <leader>4 :diffget 4<CR>

"Git bindings
nnoremap <silent> <leader>gs :G <CR>
nnoremap <silent> <leader>gd :Gvdiff <CR>
nnoremap <silent> <leader>gc :Gcommit <CR>
nnoremap <silent> <leader>gb :Gblame <CR>
nnoremap <silent> <leader>gl :Glog <CR>
nnoremap <silent> <leader>gp :Git push <CR>
nnoremap <silent> <leader>gw :Gwrite! <CR>

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

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
let g:test#strategy = 'asyncrun'

"Switch
nnoremap - :Switch<cr>

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"Key remaps
inoremap jj <ESC>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" FT Specific
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.rabl set ft=ruby
au BufRead,BufNewFile schema.js set ft=graphql

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType markdown let b:dispatch = 'octodown %'
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:elm_format_autosave = 1
let g:elm_make_output_file = "./dist/elm.js"
let g:elm_make_show_warnings = 0
let g:rooter_patterns = ['Rakefile', '.git/', '.envrc']
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"JS
let g:jsx_ext_required = 1

"Conquer Of Completion

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-pairs', 'coc-ultisnips', 'coc-json', 'coc-solargraph', 'coc-lists', 'coc-elixir' ]

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

nmap <leader>lr <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

nnoremap <leader>p :Files<cr>
nnoremap <leader>s :Buffers<Cr>
nnoremap <leader>/ :Rg<Cr>

" " Tmux
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nmap <silent> ,vk :VtrKillRunner<CR>

set hidden
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'typescript'],
\   'reason': ['ocaml-language-server'],
\   'graphql': ['gqlint'],
\   'svelte': ['stylelint', 'eslint']
\  }

let g:ale_linter_aliases = {
\  'javascript.jsx': 'javascript',
\  'typescript.tsx': 'typescript',
\  'typescriptreact': 'typescript',
\  'svelte': ['css', 'javascript']
\  }

let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint'],
\   'reason': ['refmt'],
\   }

let g:ale_sign_error = '✖'
" hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
" hi ALEWarningSign guifg=#F2C38F

if has('nvim')
  set termguicolors
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
