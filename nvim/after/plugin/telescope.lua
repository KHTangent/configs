local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Find in folder"})
vim.keymap.set("n", "<C-p>", builtin.git_files, {desc = "Find in Git files"})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Find: ") })
end, {desc = "Grep in project"})

