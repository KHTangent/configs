---@type LazySpec
return {
	"ojroques/nvim-bufdel",
	keys = {
		{
			"<leader>w",
			":BufDel<cr>",
			desc = "Close current buffer",
			silent = true,
		}
	}
}
