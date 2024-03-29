require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim')
    use('neovim/nvim-lspconfig')
    use('onsails/lspkind-nvim')
    use({
      'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'jose-elias-alvarez/null-ls.nvim' }
    })
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-buffer' },
        { "saadparwaiz1/cmp_luasnip" },
        { "ray-x/cmp-treesitter" }
      },
    })
    use('prichrd/netrw.nvim')
    use('rafamadriz/friendly-snippets')
    use('L3MON4D3/LuaSnip')
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
    use 'bluz71/nvim-linefly'
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use('windwp/nvim-autopairs')
    use('terrortylor/nvim-comment')
    use('ggandor/lightspeed.nvim')
    use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nkrkv/nvim-treesitter-rescript')
    use('norcalli/nvim-colorizer.lua')
    use('sindrets/diffview.nvim')
    use('skywind3000/asynctasks.vim')
    use('skywind3000/asyncrun.vim')
    use('janko-m/vim-test')
    use('lukas-reineke/indent-blankline.nvim')
    use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })
    use('rhysd/git-messenger.vim')
    use('machakann/vim-sandwich')
    use({
      'mrjones2014/dash.nvim',
      run = 'make install',
    })
    use {'akinsho/git-conflict.nvim', config = function()
      require('git-conflict').setup()
    end}
    use({'ldelossa/gh.nvim', requires = 'ldelossa/litee.nvim'})
    use({
      'yamatsum/nvim-nonicons',
      requires = {'kyazdani42/nvim-web-devicons'}
    })
    use('ThePrimeagen/harpoon')
    use {
      "AckslD/nvim-neoclip.lua",
      requires = {
        {'nvim-telescope/telescope.nvim'},
      }
    }
    use('ggandor/leap.nvim')
    use { 'mihyaeru21/nvim-lspconfig-bundler', requires = 'neovim/nvim-lspconfig' }
    use 'nvim-tree/nvim-web-devicons'
    use 'weizheheng/ror.nvim'
    -- Themes
    --
    use({
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
        require("everforest").setup()
      end,
    })
    use "rebelot/kanagawa.nvim"
    use 'shaunsingh/nord.nvim'
    use 'JoosepAlviste/palenightfall.nvim'
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
        require("catppuccin").setup()
      end
    }

  end,
  -- display packer dialouge in the center in a floating window
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
})
