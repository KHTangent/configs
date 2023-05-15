require("neo-tree").setup({
	close_if_last_window = true,
	enable_git_status = true,
	window = {
		width = 30
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false
		},
		follow_current_file = true,
		hijack_netrw_behavior = "open_default"
	},
	buffers = {
		follow_current_file = true,
		group_empty_dirs = false
	}
})
vim.keymap.set("n", "\\", ":Neotree reveal<cr>", {desc = "Show NeoTree"})
vim.keymap.set("n", "<leader>b", ":Neotree toggle show buffers right<cr>", {desc = "NeoTree show buffers"})
vim.keymap.set("n", "<leader>s", ":Neotree float git_status<cr>", {desc = "NeoTree show git status"})

