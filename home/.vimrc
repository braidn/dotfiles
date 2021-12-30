if &compatible
  set nocompatible
endif

set encoding=utf-8
scriptencoding utf-8
set rtp+=/usr/local/opt/fzf
filetype plugin indent on

let g:rainbow_active = 1
set grepprg=rg\ --vimgrep

"Color stuff
syntax enable
set background=dark
" let g:nvcode_termcolors=256
" colorscheme iceberg
" colorscheme zephyr
" colorscheme tokyonight
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
set shell=/bin/zsh
set guifont=CaskaydiaCove\ Nerd\ Font:13
let g:sneak#s_next = 1
let g:rooter_patterns = ['.git/', '.vimroot', 'Rakefile', 'package.json', 'rome.json']
"
" Leader Mapping
let mapleader = "\<Space>"
"Preserve indentations from pasteboard
noremap <leader>P :set paste<CR>:put  *<CR>:set nopaste<CR>

" Refresh open buffer if changed outside of vim
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

" Backwards compatability if moving to nvim.lua
lua require('init')

" File Tree
nnoremap <silent> <leader>e :Explore<CR>

"Yank into OS X, might require reattach-to-user clipboard"
noremap <leader>y "*y
noremap <leader>yy "*Y

" Vim Diff
map <silent> <leader>2 :diffget 2<CR>
map <silent> <leader>3 :diffget 3<CR>
map <silent> <leader>4 :diffget 4<CR>

"Git bindings
nnoremap <silent> <leader>gs :Neogit kind=split <CR>
nnoremap <silent> <leader>gm :GitMessenger <CR>

tnoremap <Leader><ESC> <C-\><C-n>

"Tasks
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
nnoremap ,tf :AsyncTask file-fix<cr>
nnoremap ,tr :AsyncRun
nnoremap ,tl :AsyncTaskList<cr>

" Testing
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
nnoremap <Leader>ts :TestSuite<cr>
function! DockerTransform(cmd) abort
  return 'docker-compose run --rm test '.a:cmd
endfunction

nnoremap <leader>twd :let g:test#transformation = 'docker'<cr>
let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#strategy = 'asyncrun_background'
let g:asynctasks_extra_config = [
    \ '~/src/.tasks'
    \ ]

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
nnoremap gp `[v`]

" FT Specific

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gina-commit setlocal spell textwidth=72
autocmd FileType markdown let b:dispatch = 'octodown %'
autocmd User TelescopePreviewerLoaded setlocal wrap

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
let g:python3_host_prog = '/opt/homebrew/bin//python3'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

inoremap <silent> <C-j> <cmd>lua require'luasnip'.expand_or_jump() <CR>
inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(-1) <CR>

let g:numbers_exclude = ['fzf', 'terminal', 'floaterm', 'NvimTree', 'Telescope', 'nnn']

let g:asyncrun_open = 6
match Todo /\s\+$/

command! PackerInstall packadd packer.nvim | lua require('plugins').install()
command! PackerUpdate packadd packer.nvim | lua require('plugins').update()
command! PackerSync packadd packer.nvim | lua require('plugins').sync()
command! PackerClean packadd packer.nvim | lua require('plugins').clean()
command! PackerCompile packadd packer.nvim | lua require('plugins').compile()
