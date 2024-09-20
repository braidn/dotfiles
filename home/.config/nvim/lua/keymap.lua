local function map(mode, bind, exec, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, bind, exec, opts)
end

local opt = {} --empty opt for maps with no extra options
local M = {}

vim.g.mapleader = ' '
map("i", "jj", "<ESC>", opt)

local cmp = require('cmp')
M.cmp_mappings = {
	['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
}

-- map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>pf", [[<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>pg", [[<Cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>fa", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
-- map("n", "<Leader>fq", [[<Cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>fr", [[<Cmd>lua require('telescope.builtin').registers(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>st", [[<Cmd>lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown({}))<CR>]], opt)
-- map("n", "<Leader>ca", [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], opt)
-- map("n", "<Leader><Leader>", [[<Cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_dropdown({}))<CR>]], opt)
map("n", "<Leader>cl", [[<Cmd>:let @+ = expand('%:p')<CR>]], opt)
map("n", "<Leader>ff", [[<cmd>lua require('fzf-lua').files()<CR>]], opt)
map("n", "<Leader>fb", [[<cmd>lua require('fzf-lua').buffers()<CR>]], opt)
map("n", "<Leader>gf", [[<cmd>lua require('fzf-lua').git_files()<CR>]], opt)
map("n", "<Leader>fa", [[<cmd>lua require('fzf-lua').live_grep()<CR>]], opt)
map("n", "<Leader>fq", [[<cmd>lua require('fzf-lua').quickfix()<CR>]], opt)
map("n", "<Leader>ca", [[<cmd>lua require('fzf-lua').lsp_code_actions()<CR>]], opt)
map("n", "<Leader><Leader>", [[<cmd>lua require('fzf-lua').command_history()<CR>]], opt)

-- map("n", ";", ":", opt)
-- map("v", ":", ";", opt)

return M
