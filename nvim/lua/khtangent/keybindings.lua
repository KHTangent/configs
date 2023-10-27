vim.g.mapleader = " "

vim.keymap.set({"n", "v", "o"}, "ø", "^")
vim.keymap.set({"n", "v", "o"}, "æ", "$")

vim.keymap.set("n", "<M-j>", "<C-E>", {desc = "Scroll down"})
vim.keymap.set("n", "<M-k>", "<C-Y>", {desc = "Scroll up"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader><leader>", "zz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>r", ":edit<CR>", {desc = "Reload file"})
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

vim.keymap.set("n", "Ø", "<C-w>j<C-w>q<C-w>l", {desc = "Close lower window"})

