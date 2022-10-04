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
    use('rafamadriz/friendly-snippets')
    use('L3MON4D3/LuaSnip')
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
    use "strash/everybody-wants-that-line.nvim"
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      tag = 'nightly'
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
    -- use('github/copilot.vim')
    -- Themes
    --
    use('folke/tokyonight.nvim')
    use({ "EdenEast/nightfox.nvim", branch = "main" })
    use('sainnhe/everforest')
    use({
      "catppuccin/nvim",
      as = "catppuccin"
    })
    use "rebelot/kanagawa.nvim"

  end,
  -- display packer dialouge in the center in a floating window
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
})
