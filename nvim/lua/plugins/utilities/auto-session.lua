---@type LazySpec
return {
	"rmagatti/auto-session",
	init = function()
		vim.o.sessionoptions = "blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
	---@type AutoSession.Config
	opts = {
		auto_session_suppress_dirs = { "~/", "~/Desktop", "/" },
		args_allow_single_directory = false,
		pre_save_cmds = {
			"Neotree close",
		},
		post_restore_cmds = {
			"Neotree reveal",
		},
	},
}
