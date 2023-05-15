local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Utilities
	use("tpope/vim-fugitive")
	use("lambdalisue/suda.vim")
	use("mg979/vim-visual-multi")
	use("tpope/vim-surround")
	use("numToStr/Comment.nvim")
	use("tpope/vim-sleuth")
	use {
		"folke/which-key.nvim",
		config = function ()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				triggers = "auto"
			}
		end
	}
	use {
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup {
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
			}
		end
	}

	-- Navigation
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use("theprimeagen/harpoon")
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}
	use {
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup{}
		end
	}

	-- Autocomplete-related
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
	use("mattn/emmet-vim")

	-- Visual
	use({
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup()
			vim.cmd[[colorscheme dracula]]
		end
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

