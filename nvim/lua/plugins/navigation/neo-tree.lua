---@type LazySpec
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
	end,
	---@type neotree.Config
	opts = {
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
	},
	keys = {
		{
			"\\",
			"<cmd>Neotree reveal<cr>",
			mode = { "n" },
			desc = "Neotree Reveal",
		},
	},
}
