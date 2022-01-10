-- Load All packer
require('plugins')
require('keymap')
require('options')
require('autocmds')
require('config.plugins')
require('lsp')
-- Set Current Theme
vim.g.everforest_background = 'soft'
vim.o.background = 'dark'
vim.cmd[[colorscheme catppuccin]]
