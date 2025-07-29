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
	"kylechui/nvim-surround",
	"rmagatti/auto-session",
	"RaafatTurki/hex.nvim",
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
			require("which-key").setup()
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
	{
		"mistricky/codesnap.nvim",
		build = "make",
	},
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh 1",
	},
	{
		"Goose97/timber.nvim",
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
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"Marskey/telescope-sg",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup{}
		end
	},
	"ojroques/nvim-bufdel",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		run = ":TSUpdate",
	},

	-- LSP server installation and configs
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		}
	},

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"stevearc/conform.nvim",
		opts = {}
	},

	-- Visual
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				transparent_bg = true
			})
			vim.cmd[[colorscheme dracula]]
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons", opt = true},
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},
	"hiphish/rainbow-delimiters.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- Fun
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function() require("duck").hatch("󰇥") end, {desc="Hatch duck"})
			vim.keymap.set("n", "<leader>dm", function() require("duck").hatch("ඞ") end, {desc="Hatch mogus"})
			vim.keymap.set("n", "<leader>dt", function() require("duck").hatch("") end, {desc="Hatch dragon"})
			vim.keymap.set("n", "<leader>dk", function() require("duck").cook() end, {desc="Kill one duck"})
			vim.keymap.set("n", "<leader>da", function() require("duck").cook_all() end, {desc="Kill all ducks"})
		end
	}
}

require("lazy").setup(plugins)

