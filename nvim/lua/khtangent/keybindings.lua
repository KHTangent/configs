vim.g.mapleader = " "

vim.keymap.set({"n", "v", "o"}, "ø", "^")
vim.keymap.set({"n", "v", "o"}, "æ", "$")

vim.keymap.set("n", "<M-j>", "<C-E>", {desc = "Scroll down"})
vim.keymap.set("n", "<M-k>", "<C-Y>", {desc = "Scroll up"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

