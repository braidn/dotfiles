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
		use({ 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } })
    use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
		use('windwp/nvim-autopairs')
		use('terrortylor/nvim-comment')
		use('phaazon/hop.nvim')
		use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })
		use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nkrkv/nvim-treesitter-rescript')
		use('norcalli/nvim-colorizer.lua')
    use({
      'yamatsum/nvim-nonicons',
      requires = {'kyazdani42/nvim-web-devicons'}
    })
    use('sindrets/diffview.nvim')
    use('skywind3000/asynctasks.vim')
    use('skywind3000/asyncrun.vim')
    use('janko-m/vim-test')
    use('lukas-reineke/indent-blankline.nvim')
    use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })
    use('rhysd/git-messenger.vim')
    use 'voldikss/vim-floaterm'
    use('machakann/vim-sandwich')
    -- Themes
    --
    use('folke/tokyonight.nvim')
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
