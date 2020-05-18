
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
" Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'
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
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'itspriddle/vim-marked'
Plug 'sheerun/vim-polyglot'
Plug 'othree/jspc.vim'
Plug 'honza/vim-snippets'
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'kballard/vim-swift', { 'for': 'swift' }
Plug 'dafufer/nvim-cm-swift-completer', { 'for': 'swift' }
Plug 'burner/vim-svelte', { 'for': 'svelte' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'neovim/nvim-lsp'
Plug 'tmsvg/pear-tree'
Plug 'airblade/vim-rooter'

" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'rizzatti/dash.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

""Will you make the cut
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'rbong/vim-flog'
Plug 'malkomalko/projections.vim'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'jparise/vim-graphql'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'othree/csscomplete.vim'
Plug 'othree/html5.vim'
Plug 'othree/jspc.vim'
Plug 'metakirby5/codi.vim'
Plug 'SirVer/ultisnips'
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }


call plug#end()            " required
filetype plugin indent on
runtime macros/sandwich/keymap/surround.vim

let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitstatus', 'filename'  ] ],
      \   'right': [ [ 'lineinfo'  ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype'  ]  ]
      \ },
      \ 'component_function': {
      \   'gitstatus': 'MyGitStatus',
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

function MyGitStatus() abort
	  let branch = gina#component#repo#branch()
	  let status = gina#component#status#preset('fancy')
	  return printf(
	        \ '%s %s',
	        \ branch,
	        \ status,
	        \)
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
set background=dark
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
set shell=/usr/local/bin/zsh
let g:sneak#s_next = 1
let g:rooter_patterns = ['.git/', '.vimroot', 'Rakefile', 'package.json', 'rome.json']

" Refresh open buffer if changed outside of vim
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
nnoremap <leader>r :checktime<cr>

"Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_liststyle=3
let g:netrw_chgwin=2
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_localrmdir='rm -r'
noremap <leader>pd :Vexplore <CR>

"Yank into OS X, might require reattach-to-user clipboard"
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentations from pasteboard
noremap <leader>P :set paste<CR>:put  *<CR>:set nopaste<CR>

" Leader Mapping
let mapleader = "\<Space>"

nnoremap <Leader>sl :set cc=80<CR>
nnoremap <leader>tw :set textwidth=80<cr>
nnoremap <leader>twd :let g:test#transformation = 'docker'<cr>

" Vim Diff
map <silent> <leader>2 :diffget 2<CR>
map <silent> <leader>3 :diffget 3<CR>
map <silent> <leader>4 :diffget 4<CR>

"Git bindings
nnoremap <silent> <leader>gs :Gina status <CR>
" nnoremap <silent> <leader>gd <Plug>(gina-diff-vsplit)
nnoremap <silent> <leader>gc :Gina commit -v <CR>
nnoremap <silent> <leader>gl :Gina log <CR>
nnoremap <silent> <leader>gp :Gina push <CR>
nnoremap <silent> <leader>gw :Gina write <CR>
nnoremap <silent> <leader>gm :GitMessenger <CR>

"Indent Lines
hi Conceal ctermfg=red ctermbg=NONE

tnoremap <Leader><ESC> <C-\><C-n>
"
"Tasks
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
nnoremap <Leader>atf :AsyncTask file-fix<cr>
nnoremap <Leader>atr :AsyncTask file-run<cr>
nnoremap <Leader>atl :AsyncTaskList<cr>

" Testing
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
function! DockerTransform(cmd) abort
  return 'docker-compose run --rm test '.a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#strategy = 'asyncrun_background'

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

let g:flog_default_arguments = { 'max_count': 1000 }

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"JS
let g:jsx_ext_required = 1
let g:vim_json_syntax_conceal = 0

" Deoplete/Snippets Resurrection
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:neosnippet#disable_runtime_snippets = {
        \   '_' : 1,
        \ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets/'

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Lang Server
lua require'nvim_lsp'.solargraph.setup{}
lua require'nvim_lsp'.tsserver.setup{}
lua require'nvim_lsp'.ocamlls.setup{}
lua require'nvim_lsp'.jsonls.setup{}

nnoremap <silent> ,dc <cmd> lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ,df <cmd> lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ,td <cmd> lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> ,h  <cmd> lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ,i  <cmd> lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ,r  <cmd> lua vim.lsp.buf.references()<CR>
nnoremap <silent> ,s  <cmd> lua vim.lsp.buf.signature_help()<CR>

" === Denite setup ==="
try
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
"
" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nnoremap <leader>p :Denite file/rec<CR>
nnoremap <leader>b :Denite buffer<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader># :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

set hidden
let g:asyncrun_open = 6

if has('nvim')
  set termguicolors
endif

match Todo /\s\+$/

if exists('g:started_by_firenvim')
    " general options
    set wrap linebreak nolist textwidth=0 wrapmargin=0
    set laststatus=0 nonumber noruler noshowcmd

    augroup firenvim
        autocmd!
        autocmd BufEnter *.txt setlocal filetype=markdown.pandoc
    augroup END
endif

