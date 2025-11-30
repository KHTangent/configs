return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ojroques/nvim-bufdel",
	},
	lazy = false,
	init = function()
		vim.opt.termguicolors = true
	end,
	opts = {
		options = {
			close_command = "BufDel %d",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true
				}
			}
		}
	},
	keys = {
		{
			"<Tab>",
			":BufferLineCycleNext<CR>",
			desc = "Go to next tab",
			silent = true,
		},
		{
			"<S-Tab>",
			":BufferLineCyclePrev<CR>",
			desc = "Go to prev tab",
			silent = true,
		},
		{
			"<leader><Tab>",
			":BufferLineMoveNext<CR>",
			desc = "Move tab forward",
			silent = true,
		},
		{
			"<leader><S-Tab>",
			":BufferLineMovePrev<CR>",
			desc = "Move tab backwards",
			silent = true,
		},
	},
}
