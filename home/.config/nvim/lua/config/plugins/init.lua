local lspconfig = require("lspconfig")
lspconfig.tsserver.setup{
  on_attach = function(client, bufnr)
    -- disable tsserver formatting if you plan on formatting via null-ls
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers indicate higher priority
      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 2, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint",
      eslint_enable_diagnostics = false,
      eslint_opts = {},

      enable_formatting = false,
      formatter = "prettierd",
      formatter_opts = {},

      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,

      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",
    }

    ts_utils.setup_client(client)

  end
}
lspconfig.solargraph.setup{}
lspconfig.jsonls.setup{}
lspconfig.terraformls.setup{}
lspconfig.scry.setup{}
lspconfig.html.setup{}
lspconfig.denols.setup{autostart = false}
lspconfig.rescriptls.setup{
  cmd = {
    'node',
    '/Users/braidn/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js',
    '--stdio'
  }
}

require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    update_in_insert = false,
  }
)

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    indent_blankline_use_treesitter = true,
    buftype_exclude = {"terminal"}
}

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'default',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

local keymap = require("keymap")
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
    }),
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
	mapping = keymap.cmp_mappings,
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
  completion = {
    get_trigger_characters = function(trigger_characters)
      return vim.tbl_filter(function(char)
        return char ~= ' '
      end, trigger_characters)
    end
  }
}

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

	local opts = { noremap = true, silent = true }

  buf_map(bufnr, "n", ",de", ":LspDef<CR>")
  buf_map(bufnr, "n", ",rn", ":LspRename<CR>")
  buf_map(bufnr, "n", ",td", ":LspTypeDef<CR>")
  buf_map(bufnr, "n", ",h", ":LspHover<CR>")
  buf_map(bufnr, "n", "g[", ":LspDiagPrev<CR>")
  buf_map(bufnr, "n", "g]", ":LspDiagNext<CR>")
  buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
  buf_map(bufnr, "n", ",di", ":LspDiagLine<CR>")
  buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
			false
		)
	end
end

local null_ls = require("null-ls")
local sources = {
  null_ls.builtins.formatting.prettierd.with({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql", "ruby" }
  })
}
null_ls.setup({ sources = sources, on_attach = on_attach })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
require('nvim-autopairs').setup({
	disable_filetype = { 'telescopeprompt', 'vim' },
})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())

require('lualine').setup {
  options = { theme = 'everforest', section_separators = '', component_separators = '' }
}
-- require('telescope').setup{
--   defaults = {
--     vimgrep_arguments = {
--       'rg',
--       '--color=never',
--       '--no-heading',
--       '--with-filename',
--       '--line-number',
--       '--column',
--       '--smart-case'
--     },
--     prompt_prefix = "> ",
--     selection_caret = "> ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "descending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       horizontal = {
--         mirror = false,
--       },
--       vertical = {
--         mirror = false,
--       },
--     },
--     file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--     file_ignore_patterns = {},
--     generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--     winblend = 0,
--     border = {},
--     borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--     color_devicons = true,
--     use_less = true,
--     path_display = {},
--     set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--     file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--     grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--     qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
-- 
--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
--   }
-- }

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
  disable_hint = true,
  commit_popup = {
      kind = "vsplit",
  },
  integrations = {
    diffview = true
  }
}
require('colorizer').setup(nil, { names = false })
require('nvim_comment').setup()
require'nvim-treesitter.install'.compilers = { "clang" }
require"nvim-treesitter.configs".setup {
  ignore_install = { "haskell" },
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  matchup = {
    enable = true,
	},
	context_commentstring = {
		enable = true
	}
}


require('kanagawa').setup({
  undercurl = true,           -- enable undercurls
  commentStyle = "italic",
  functionStyle = "NONE",
  keywordStyle = "NONE",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "italic",
  specialReturn = true,       -- special highlight for the return keyword
  specialException = true,    -- special highlight for exception handling keywords 
  transparent = false,        -- do not set background color
  colors = {},
  overrides = {},
})
-- local catppuccin = require("catppuccin")
-- configure it
-- catppuccin.setup(
--     {
-- 		transparent_background = false,
-- 		term_colors = false,
-- 		styles = {
-- 			comments = "italic",
-- 			functions = "NONE",
-- 			keywords = "NONE",
-- 			strings = "NONE",
-- 			variables = "NONE",
-- 		},
-- 		integrations = {
-- 			treesitter = true,
-- 			native_lsp = {
-- 				enabled = true,
-- 				virtual_text = {
-- 					errors = "italic",
-- 					hints = "italic",
-- 					warnings = "italic",
-- 					information = "italic",
-- 				},
-- 				underlines = {
-- 					errors = "underline",
-- 					hints = "underline",
-- 					warnings = "underline",
-- 					information = "underline",
-- 				},
-- 			},
-- 			lsp_trouble = false,
-- 			lsp_saga = false,
-- 			gitgutter = false,
-- 			gitsigns = false,
-- 			telescope = false,
-- 			nvimtree = {
-- 				enabled = false,
-- 				show_root = true,
-- 			},
-- 			which_key = false,
-- 			indent_blankline = {
-- 				enabled = true,
-- 				colored_indent_levels = true,
-- 			},
-- 			dashboard = false,
-- 			neogit = true,
-- 			vim_sneak = false,
-- 			fern = false,
-- 			barbar = false,
-- 			bufferline = false,
-- 			markdown = false,
-- 			lightspeed = false,
-- 			ts_rainbow = false,
-- 			hop = true,
--       cmp = true
-- 		},
-- 	}
-- )

require'fzf-lua'.setup {
  fzf_bin = 'sk',
}
