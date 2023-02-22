vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Lex)

vim.keymap.set("n", "ø", "^")
vim.keymap.set("n", "æ", "$")
vim.keymap.set("v", "ø", "^")
vim.keymap.set("v", "æ", "$")
vim.keymap.set("o", "ø", "^")
vim.keymap.set("o", "æ", "$")

vim.keymap.set("n", "<M-j>", "<C-E>")
vim.keymap.set("n", "<M-k>", "<C-Y>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")
