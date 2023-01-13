vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		-- run = ':TSUpdate'
	}

	-- LSP + Completion
	use {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		-- 'mfussenegger/nvim-dap',
		-- 'jayp0521/mason-nvim-dap.nvim',
		'jose-elias-alvarez/null-ls.nvim',
		'jayp0521/mason-null-ls.nvim',
		'onsails/lspkind.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'p00f/clangd_extensions.nvim',
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'renerocksai/calendar-vim'
	use 'nvim-telescope/telescope-symbols.nvim'
	use 'renerocksai/telekasten.nvim'
	use 'ahmedkhalf/project.nvim'

	-- Generally handy
	use 'airblade/vim-rooter'
	use 'tpope/vim-abolish'
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-unimpaired'
	use 'spiiph/vim-space'
	use 'wellle/targets.vim'
	use 'junegunn/vim-easy-align'
	use 'tamago324/lir.nvim'
	use 'joereynolds/vim-minisnip'
	use 'rgroli/other.nvim'
	use 'folke/zen-mode.nvim'
	use 'rcarriga/nvim-notify'
	use 'b3nj5m1n/kommentary'
	use 'jakewvincent/mkdnflow.nvim'
	use({
    	"iamcco/markdown-preview.nvim",
    	run = function() vim.fn["mkdp#util#install"]() end,
	})
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- Colors + fancy ui
	use 'sainnhe/gruvbox-material'
	use 'ellisonleao/gruvbox.nvim'
	-- use 'jacoborus/tender.vim'
	-- use 'savq/melange'
	-- use 'glepnir/zephyr-nvim'
	-- use 'sainnhe/edge'
	-- use 'Th3Whit3Wolf/one-nvim'
	-- use 'Th3Whit3Wolf/space-nvim'
	-- use 'ofirgall/ofirkai.nvim'
	-- use 'lourenci/github-colors'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- GIT
	use 'tpope/vim-fugitive'
	use 'junegunn/gv.vim'

	-- Tasks / Aync
	use 'skywind3000/asynctasks.vim'
	use 'skywind3000/asyncrun.vim'
	use 's133p/personal-magic.vim'

end)
