require("neo-tree").setup({
	close_if_last_window = true,
	enable_git_status = true,
	window = {
		position = "left",
		width = 30,
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false
		},
		follow_current_file = {
			enable = true,
		},
		hijack_netrw_behavior = "open_default"
	},
	buffers = {
		group_empty_dirs = false
	}
})
vim.keymap.set("n", "\\", ":Neotree reveal<cr>", {desc = "Show NeoTree"})

