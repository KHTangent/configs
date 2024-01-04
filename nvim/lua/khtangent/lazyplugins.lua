local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Utilities
	"lambdalisue/suda.vim",
	"mg979/vim-visual-multi",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"machakann/vim-sandwich",
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"NMAC427/guess-indent.nvim",
		config = true,
	},
	{
		"folke/which-key.nvim",
		config = function ()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				triggers = "auto"
			}
		end
	},
	{
		"rmagatti/auto-session",
		config = function()
			vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end
	},
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				yaml = true,
				markdown = true,
			}
		end
	},
	{
		"glacambre/firenvim",
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn['firenvim#install'](0)
		end
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	{
		"smoka7/hop.nvim",
		config = true,
	},

	-- Git plugins
	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require("gitsigns").setup {
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 250,
				}
			}
		end
	},

	-- Navigation
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		}
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function ()
			vim.g.neo_tree_remove_legacy_commands = 1
		end
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup{}
		end
	},
	"ojroques/nvim-bufdel",

	-- LSP and such
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		run = ":TSUpdate",
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-nvim-lsp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"saadparwaiz1/cmp_luasnip"},
			{"hrsh7th/cmp-nvim-lua"},

			-- Snippets
			{"L3MON4D3/LuaSnip"},
			{"rafamadriz/friendly-snippets"},
		}
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"stevearc/conform.nvim",
		opts = {}
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		}
	},

	-- Visual
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup()
			vim.cmd[[colorscheme dracula]]
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons", opt = true},
		config = function ()
			require("lualine").setup {
				options = {
					theme = "dracula",
				},
			}
		end
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},
	{
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
	},
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end
	},
	{
		"shellRaining/hlchunk.nvim"
	},

	-- Fun
	{
		"andweeb/presence.nvim",
		config = true,
	},
}

require("lazy").setup(plugins)

