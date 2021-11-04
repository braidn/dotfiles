local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({})
  end

  local use = packer.use
  packer.reset()

  -- Packer, the one and only.
  use 'wbthomason/packer.nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'mattn/gist-vim'
  use 'mattn/webapi-vim'
  use 'justinmk/vim-sneak'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'yuezk/vim-js'
  use 'HerringtonDarkholme/yats.vim'
  use 'tpope/vim-rails'
  use 'tpope/vim-surround'
  use 'machakann/vim-sandwich'
  use 'AndrewRadev/switch.vim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'rhysd/git-messenger.vim'
  use 'tpope/vim-repeat'
  use 'janko-m/vim-test'
  use 'b3niup/numbers.vim'
  use 'mbbill/undotree'
  use 'thoughtbot/vim-rspec'
  use 'tpope/vim-dispatch'
  use 'fatih/vim-go'
  use 'editorconfig/editorconfig-vim'
  use 'itspriddle/vim-marked'
  use 'othree/jspc.vim'
  use 'burner/vim-svelte'
  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'
  use 'ryanoasis/vim-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'neovim/nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use 'elzr/vim-json'
  use 'malkomalko/projections.vim'
  use 'mxw/vim-jsx'
  use 'xolox/vim-misc'
  use 'jparise/vim-graphql'
  use 'rescript-lang/vim-rescript'
  use 'nkrkv/nvim-treesitter-rescript'
  use 'othree/csscomplete.vim'
  use 'othree/html5.vim'
  use 'metakirby5/codi.vim'
  use 'glepnir/lspsaga.nvim'
  use {'andymass/vim-matchup', event = 'VimEnter *'}
  use "ray-x/lsp_signature.nvim"
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = function()
          return require('ts_context_commentstring.internal').calculate_commentstring()
        end
      })
    end
  }
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'
  use { 'mrjones2014/dash.nvim', requires = { 'nvim-telescope/telescope.nvim' } }
  use { "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "ray-x/cmp-treesitter"
    }
  }
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'onsails/lspkind-nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'jose-elias-alvarez/null-ls.nvim' }
  }
  use {
    'IndianBoy42/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      local hint = require'hop.hint'
      hint.treesitter_queries(
        query, -- string, Capture group, if nil then it uses all the capture groups in the queryfile
        inners, -- boolean, For textobjects whether to use `.inner`
        outers, -- boolean, For textobjects whether to use `.outer`
        queryfile -- string, textobjects if nil else the file to run capture
      )
      -- Add hints to locals matching some filter
      hint.treesitter_locals(filter)
      require'hop'.setup { 
        keys = 'etovxqpdygfblzhckisuran' 
      }
    end
  }
  use 'sindrets/diffview.nvim'
  use 'EdenEast/nightfox.nvim'
  use {
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup({
      explorer = {
        cmd = "nnn", -- command overrride (-p and -F1 flags are implied, -a flag is invalid!)
        width = 30, -- width of the vertical split
        session = "", -- or global/local/shared
      },
      replace_netrw = "explorer",
      mappings = {
        { "<C-s>", "split" }, -- open file in split
        { "<C-v>", "vsplit" }, -- open file in vertical split
      }
    }) end
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
