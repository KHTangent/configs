local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "Add file to Harpoon list"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Toggle Harpoon menu"})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, {desc = "Go to file 1"})
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, {desc = "Go to file 2"})
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, {desc = "Go to file 3"})
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, {desc = "Go to file 4"})

