vim.o.sessionoptions="blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"

require("auto-session").setup {
	auto_session_suppress_dirs = { "~/", "~/Desktop", "/"},
	args_allow_single_directory = false,
	pre_save_cmds = {
		"Neotree close",
	},
	post_restore_cmds = {
		"Neotree reveal",
	},
}

