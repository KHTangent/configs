local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Find in folder"})
vim.keymap.set("n", "<C-p>", function ()
	builtin.git_files({
		recurse_submodules = true,
	})
end, {desc = "Find in Git files"})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {desc = "View git status"})

vim.keymap.set("n", "<leader>ps", builtin.live_grep, {desc = "Grep in project"})

vim.keymap.set("n", "<leader>fc", builtin.commands, {desc = "Find command"})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {desc = "Find keymaps"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Find help pages"})

telescope.setup({
	defaults = {
		layout_config = {
			horizontal = {
				preview_width = 0.5
			}
		}
	}
})

