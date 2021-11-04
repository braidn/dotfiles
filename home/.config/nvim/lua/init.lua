local opt = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

require("null-ls").setup {}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.tsserver.setup{
  autostart = false,
  on_attach = function(client, bufnr)
    -- disable tsserver formatting if you plan on formatting via null-ls
    client.resolved_capabilities.document_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint",
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = false,

      -- formatting
      enable_formatting = false,
      formatter = "prettier",
      formatter_config_fallback = nil,

      -- parentheses completion
      complete_parens = false,
      signature_help_in_parens = false,

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    }

    -- required to fix code action ranges
    ts_utils.setup_client(client)
  end
}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.terraformls.setup{}
require'lspconfig'.scry.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.denols.setup{
  autostart = false
}
require'lspconfig'.rescriptls.setup{
  cmd = {
    'node',
    '/Users/braidn/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js',
    '--stdio'
  }
}
local saga = require 'lspsaga'
saga.init_lsp_saga()

local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

-- Map compe confirm and complete functions
-- map("i", "<cr>", 'compe#confirm("<cr>")', { expr = true })
-- map("i", "<C-e>", 'compe#confirm("<C-e>")', { expr = true })
-- map("i", "<C-space>", 'compe#complete()', { expr = true })

map("n", ",h", [[<cmd> lua vim.lsp.buf.hover()<CR>]], opt)
map("n", ",s", [[<cmd> lua vim.lsp.buf.signature_help()<CR>]], opt)
map("n", ",rn", [[<cmd> lua vim.lsp.buf.rename()<CR>]], opt)
map("n", ",td", [[<cmd> lua vim.lsp.buf.type_definition()<CR>]], opt)
map("n", ",di", [[<cmd> lua vim.lsp.diagnostic.show_line_diagnostics() <CR>]], opt)
map("n", ",dc", [[<cmd> lua vim.lsp.buf.declaration()<CR>]], opt)
map("n", ",dl", [[<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>]], opt)
map("n", ",i", [[<cmd> lua vim.lsp.buf.implementation()<CR>]], opt)
map("n", "<leader>h", [[<cmd> lua require'lsp_extensions'.inlay_hints{ only_current_line = true } <CR>]], opt)
map("n", "<leader>H", [[<cmd> lua require'lsp_extensions'.inlay_hints() <CR>]], opt)
map("n", "g[", [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], opt)
map("n", "g]", [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], opt)

-- map("n", ",ca", [[<cmd> lua require('lspsaga.codeaction').code_action()<CR>]], opt)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    update_in_insert = false,
  }
)

local cmp = require'cmp'
cmp.setup {
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'treesitter' }
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })[entry.source.name]
      return vim_item
    end,
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('nvim-autopairs').setup{}
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})

-- require'compe'.setup {
--   enabled = true,
--   autocomplete = true,
--   debug = false,
--   min_length = 1,
--   preselect = "disabled",
--   throttle_time = 80,
--   source_timeout = 200,
--   incomplete_delay = 400,
--   max_abbr_width = 100,
--   max_kind_width = 100,
--   max_menu_width = 100,
--   documentation = true,
--   source = {
--     path = true,
--     buffer = true,
--     luasnip = true,
--     nvim_lsp = true,
--     nvim_lua = true,
--     treesitter = true,
--     calc = true,
--   };
-- }

require"nvim-treesitter.configs".setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require('nightfox').load()
require('lualine').setup {
  options = { theme = 'nightfox', section_separators = '', component_separators = '' }
}
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
-- mappings
vim.api.nvim_set_keymap("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>gf", [[<Cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({}))<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fa", [[<Cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fq", [[<Cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_dropdown({}))<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>ca", [[<Cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader><Leader>", [[<Cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_dropdown({}))<CR>]], opt)

-- map("n", "<Leader>ff", [[<Cmd>lua require('fzf-lua').files()<CR>]], opt)
-- map("n", "<Leader>fb", [[<Cmd>lua require('fzf-lua').buffers()<CR>]], opt)
-- map("n", "<Leader>gf", [[<Cmd>lua require('fzf-lua').git_files()<CR>]], opt)
-- map("n", "<Leader>fd", [[<Cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>]], opt)
-- map("n", "<Leader>fg", [[<Cmd>lua require('fzf-lua').grep()<CR>]], opt)


-- Diffview
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true,        -- Requires nvim-web-devicons
  file_panel = {
    width = 35,
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["o"]             = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
}

local neogit = require("neogit")
neogit.setup{
  disable_hint = true
}
require "lsp_signature".setup()
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

neogit.setup {
  integrations = {
    diffview = true
  }
}
