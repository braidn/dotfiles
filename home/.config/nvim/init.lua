-- Load All packer
require('plugins')
require('keymap')
require('options')
require('autocmds')
require('config.plugins')
require('lsp')

-- Set Current Theme
vim.cmd[[colorscheme catppuccin]]

-- Set Icons
local icons = require "nvim-nonicons"
icons.get("file")
