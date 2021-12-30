local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local o = vim.o

cmd('syntax on') 	-- syntax highlighting
o.rnu = true         	-- relative line numbers
o.nu = true         	-- line numbers
o.modeline = true   	-- modline
o.modelines = 5

o.errorbells = false 	-- auditory stimulation annoying

opt.ruler = false
opt.hidden = true 		-- keeps buffers loaded in the background
opt.ignorecase = true
opt.scrolloff = 8   	-- buffer starts scrolling 8 lines from the end of view

-- Tab settings
o.tabstop = 2 			-- 4 tabstop
o.shiftwidth = 2
o.expandtab = true    	-- tabs -> spaces
o.smartindent = true    -- nice indenting

o.foldmethod = 'marker' 	-- set fold method to marker

-- backup/swap files
opt.swapfile = false  	-- have files saved to swap
opt.undofile = true		-- file undo history preserved outside current session
opt.wrap = false -- Nowrap

-- new win split options
opt.splitbelow = true
opt.splitright = true
o.completeopt = 'menuone,noselect'

opt.termguicolors = true

-- Netrw
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_altv = 1
g.netrw_winsize = 25
g.netrw_liststyle=3
g.netrw_chgwin=2
g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
g.netrw_localrmdir='rm -r'

cmd[[colorscheme kanagawa]]

-- # vim foldmethod=marker
