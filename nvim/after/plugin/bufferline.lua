local bufferline = require("bufferline")

bufferline.setup {
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true
			}
		}
	}
}

vim.keymap.set("n", "<leader><Tab>", ":BufferLineCycleNext<CR>", {desc = "Go to next tab"})
vim.keymap.set("n", "<leader><S-Tab>", ":BufferLineCyclePrev<CR>", {desc = "Go to prev tab"})

