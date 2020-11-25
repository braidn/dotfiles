if &compatible
  set nocompatible
endif
" set nocompatible
" call plug#begin('~/.vim/plugged')

set encoding=utf-8
scriptencoding utf-8
set shell=/bin/tcsh
set rtp+=/usr/local/opt/fzf

packadd minpac

if exists('g:loaded_minpac')
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
""Plugs
call minpac#add('cocopon/iceberg.vim')
call minpac#add('christianchiarulli/nvcode-color-schemes.vim')
call minpac#add('mattn/gist-vim')
call minpac#add('mattn/webapi-vim')
call minpac#add('justinmk/vim-sneak')
call minpac#add('Yggdroot/indentLine')
call minpac#add('othree/yajs.vim')
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-surround')
call minpac#add('machakann/vim-sandwich')
call minpac#add('AndrewRadev/switch.vim')
call minpac#add('lambdalisue/gina.vim')
call minpac#add('rhysd/git-messenger.vim')
call minpac#add('tpope/vim-repeat')
call minpac#add('janko-m/vim-test')
call minpac#add('b3niup/numbers.vim')
" call minpac#add('itchyny/lightline.vim')
call minpac#add('glepnir/galaxyline.nvim', {'type': 'opt'})
call minpac#add('mbbill/undotree')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('tpope/vim-dispatch')
call minpac#add('fatih/vim-go')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('luochen1990/rainbow')
call minpac#add('itspriddle/vim-marked')
" call minpac#add('sheerun/vim-polyglot')
call minpac#add('othree/jspc.vim')
call minpac#add('honza/vim-snippets')
call minpac#add('keith/swift.vim')
call minpac#add('kballard/vim-swift')
call minpac#add('dafufer/nvim-cm-swift-completer')
call minpac#add('burner/vim-svelte')
call minpac#add('nvim-lua/completion-nvim')
call minpac#add('steelsojka/completion-buffers')
call minpac#add('tmsvg/pear-tree')
call minpac#add('skywind3000/asynctasks.vim')
call minpac#add('skywind3000/asyncrun.vim')
call minpac#add('rizzatti/dash.vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('kyazdani42/nvim-tree.lua')
call minpac#add('kyazdani42/nvim-web-devicons')
call minpac#add('norcalli/nvim-colorizer.lua')
call minpac#add('nvim-treesitter/nvim-treesitter', {'type': 'opt'})
call minpac#add('nvim-lua/lsp_extensions.nvim')
call minpac#add('neovim/nvim-lsp')
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('elzr/vim-json')
call minpac#add('malkomalko/projections.vim')
call minpac#add('mxw/vim-jsx')
call minpac#add('xolox/vim-misc')
call minpac#add('jparise/vim-graphql')
call minpac#add('reasonml-editor/vim-reason-plus')
call minpac#add('othree/csscomplete.vim')
call minpac#add('othree/html5.vim')
call minpac#add('othree/jspc.vim')
call minpac#add('metakirby5/codi.vim')
call minpac#add('SirVer/ultisnips')
call minpac#add('nvim-lua/popup.nvim')
call minpac#add('nvim-lua/telescope.nvim', {'type': 'opt'})
call minpac#add('nvim-lua/plenary.nvim')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

filetype plugin indent on
runtime macros/sandwich/keymap/surround.vim

let g:rainbow_active = 1

if executable('ag')
  set grepprg=rg
  set grepformat=%f:%l:%c%m
endif

set grepprg=rg\ --vimgrep

"Color stuff
syntax enable
set background=dark
let g:nvcode_termcolors=256
colorscheme nord
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
"
" Leader Mapping
let mapleader = "\<Space>"
nnoremap <Leader>sl :set cc=80<CR>
nnoremap <leader>tw :set textwidth=80<cr>
"Preserve indentations from pasteboard
noremap <leader>P :set paste<CR>:put  *<CR>:set nopaste<CR>

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

"LuaTree
nnoremap <leader>e :LuaTreeToggle<CR>
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \}

"Yank into OS X, might require reattach-to-user clipboard"
noremap <leader>y "*y
noremap <leader>yy "*Y


" Vim Diff
map <silent> <leader>2 :diffget 2<CR>
map <silent> <leader>3 :diffget 3<CR>
map <silent> <leader>4 :diffget 4<CR>

"Git bindings
nnoremap <silent> <leader>gs :Gina status -s <CR>
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

" FT Specific
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.rabl set ft=ruby
au BufRead,BufNewFile schema.js set ft=graphql
au BufRead,BufNewFile *.res set ft=reason

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gina-commit setlocal spell textwidth=72
autocmd FileType markdown let b:dispatch = 'octodown %'

let g:flog_default_arguments = { 'max_count': 1000 }

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"JS
let g:jsx_ext_required = 1
let g:vim_json_syntax_conceal = 0

" LuaComplete/Snippets Resurrection
autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_enable_snippet = 'UltiSnips'
if ! exists('g:completion_chain_complete_list')
    let g:completion_chain_complete_list = {
                \ 'default' : {
                \   'default': [
                \       {'complete_items': ['lsp', 'snippet', 'buffers']},
                \       {'mode': '<c-p>'},
                \       {'mode': '<c-n>'}],
                \   'comment': []
                \   }
                \}
endif
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Lang Server
packadd nvim-lsp
lua require'lspconfig'.solargraph.setup{}
" lua require'lspconfig'.rome.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.ocamlls.setup{}
lua require'lspconfig'.jsonls.setup{}
lua require'lspconfig'.terraformls.setup{}
lua require'lspconfig'.scry.setup{}
lua require'lspconfig'.html.setup{}

nnoremap <silent> ,dc <cmd> lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ,df <cmd> lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ,td <cmd> lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> ,di <cmd> lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> ,dl <cmd> lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> ,h  <cmd> lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ,i  <cmd> lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ,r  <cmd> lua vim.lsp.buf.references()<CR>
nnoremap <silent> ,s  <cmd> lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>h :lua require'lsp_extensions'.inlay_hints{ only_current_line = true } <CR>
nnoremap <Leader>H :lua require'lsp_extensions'.inlay_hints() <CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
"
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    update_in_insert = false,
  }
)
EOF

packadd nvim-treesitter
lua << EOF
require"nvim-treesitter.configs".setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  },
}
EOF

packadd telescope.nvim
nnoremap <leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <leader>b <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <leader>/ <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <leader># <cmd>lua require'telescope.builtin'.grep_string{}<CR>
nnoremap <leader>gt <cmd>lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <leader>gf <cmd>lua require'telescope.builtin'.quickfix{}<CR>
nnoremap <leader>gp <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <leader>gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>

let g:numbers_exclude = ['fzf']

set hidden
let g:asyncrun_open = 6
match Todo /\s\+$/

if has('nvim')
  set termguicolors
endif

packadd galaxyline.nvim
lua << EOF
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#282c34',
  line_bg = '#21242b',
  fg = '#c0c0c0',

  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#c678dd',
  blue = '#51afef';
  red = '#ec5f67'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.line_bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.magenta, i = colors.green,v=colors.blue,[''] = colors.blue,V=colors.blue,
                          c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
                          [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                          cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}
gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'}
  }
}

local function find_git_root()
  local path = vim.fn.expand('%:p:h')
  local get_git_dir = require('galaxyline.provider_vcs').get_git_dir
  return get_git_dir(path)
end

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = find_git_root,
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = find_git_root,
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.line_bg},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.line_bg,colors.line_bg}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return ' ' end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  },
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.line_bg,colors.line_bg},
    highlight = {colors.fg,colors.darkblue},
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.blue,colors.purple},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}
EOF

endif
