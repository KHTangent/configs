local bufferline = require("bufferline")

bufferline.setup {
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
}

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {desc = "Go to next tab"})
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {desc = "Go to prev tab"})

