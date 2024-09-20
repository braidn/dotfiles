require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim')
    use('neovim/nvim-lspconfig')
    use('onsails/lspkind-nvim')
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
    use('bluz71/nvim-linefly')
    use({"joechrisellis/lsp-format-modifications.nvim", requires = "nvim-lua/plenary.nvim"})
    use { "ibhagwan/fzf-lua",
      -- optional for icon support
      requires = { "echasnovski/mini.icons" }
    }
    use('windwp/nvim-autopairs')
    use('terrortylor/nvim-comment')
    use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('sindrets/diffview.nvim')
    use('lukas-reineke/indent-blankline.nvim')
    use('rhysd/git-messenger.vim')
    use { 'echasnovski/mini.surround', branch = 'stable' }
    use {'akinsho/git-conflict.nvim', config = function()
      require('git-conflict').setup()
    end}
    use('ggandor/leap.nvim')
    use({
      "stevearc/conform.nvim",
        config = function()
          require("conform").setup({
            formatters_by_ft = {
              ruby = { "stree format" } }
           })
	   end,
    })
    use { "zbirenbaum/copilot.lua" }
    use { "zbirenbaum/copilot-cmp" }
    use { "nvim-treesitter/nvim-treesitter-context" }
    -- Themes
    --
    use({
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
        require("everforest").setup()
      end,
    })
    use 'matsuuu/pinkmare'
    use 'folke/tokyonight.nvim'
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
