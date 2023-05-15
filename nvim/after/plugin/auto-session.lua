require("auto-session").setup {
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
	pre_save_cmds = {
		"Neotree close",
	},
	post_restore_cmds = {
		"Neotree reveal",
		"BufferLineGoToBuffer -1",
	},
}

