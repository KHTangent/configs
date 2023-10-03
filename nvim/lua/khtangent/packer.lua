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
	use("lambdalisue/suda.vim")
	use("mg979/vim-visual-multi")
	use("tpope/vim-surround")
	use {
		"numToStr/Comment.nvim",
		config = function()
			require('Comment').setup()
		end
	}
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
			vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end
	}
	use {
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				yaml = true,
				markdown = true,
			}
		end
	}
	use {
		"glacambre/firenvim",
		run = function()
			vim.fn['firenvim#install'](0)
		end
	}
	use {
		"folke/neodev.nvim",
		run = function()
			require("neodev").setup()
		end
	}

	-- Git plugins
	use {
		"NeogitOrg/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
		}
	}
	use {
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end
	}
	use {
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("vgit").setup()
		end
	}

	-- Navigation
	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
		}
	}
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
	use("ojroques/nvim-bufdel")

	-- LSP and such
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function ()
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldlevel = 99
		end
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{"williamboman/mason.nvim"},           -- Optional
			{"williamboman/mason-lspconfig.nvim"}, -- Optional

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},         -- Required
			{"hrsh7th/cmp-nvim-lsp"},     -- Required
			{"hrsh7th/cmp-buffer"},       -- Optional
			{"hrsh7th/cmp-path"},         -- Optional
			{"saadparwaiz1/cmp_luasnip"}, -- Optional
			{"hrsh7th/cmp-nvim-lua"},     -- Optional

			-- Snippets
			{"L3MON4D3/LuaSnip"},             -- Required
			{"rafamadriz/friendly-snippets"}, -- Optional
		}
	}
	use {
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	}
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	}

	-- Visual
	use({
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup()
			vim.cmd[[colorscheme dracula]]
		end
	})
	use {
		"nvim-lualine/lualine.nvim",
		requires = {"nvim-tree/nvim-web-devicons", opt = true},
		config = function ()
			require("lualine").setup {
				options = {
					theme = "dracula",
				},
			}
		end
	}
	use {
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	}
	use {
		"hiphish/rainbow-delimiters.nvim",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
					vim = rainbow_delimiters.strategy['local'],
				},
				blacklist = {
					"html",
					"vue",
					"markdown",
				},
				query = {
					[''] = 'rainbow-delimiters',
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterOrange",
					"RainbowDelimiterRed",
					"RainbowDelimiterGreen",
					"RainbowDelimiterBlue",
					"RainbowDelimiterCyan",
					"RainbowDelimiterViolet",
				}
			}
		end
	}
	use {
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end
	}
	use {
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").setup({
				autocmd = { enabled = true },
			})
		end
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		tag = "v2.20.8",
		config = function ()
			require("indent_blankline").setup{
				char_highlight_list = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterOrange",
					"RainbowDelimiterRed",
					"RainbowDelimiterGreen",
					"RainbowDelimiterBlue",
					"RainbowDelimiterCyan",
					"RainbowDelimiterViolet",
				}
			}
		end
	}

	-- Fun
	use {
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup()
		end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

