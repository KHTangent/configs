return {
	{ import = "plugins.utilities" },
	{ import = "plugins.git" },
	{ import = "plugins.navigation" },

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
	"hrsh7th/cmp-emoji",
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
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
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
	},

	-- Testing out local AI
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
