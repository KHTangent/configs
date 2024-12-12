vim.g.mapleader = " "

-- Remap hard to reach keys on Norwegian keyboards
vim.keymap.set({"n", "v", "o"}, "ø", "^")
vim.keymap.set({"n", "v", "o"}, "æ", "$")
vim.keymap.set({"n", "v", "o"}, "å", "`")

-- Move lines while preserving indent in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Make vertical scroll behave nicely on wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep screen centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Scroll around the screen
vim.keymap.set({"n", "v", "i"}, "<M-S-h>", "zh", {desc = "Scroll left"})
vim.keymap.set({"n", "v", "i"}, "<M-S-l>", "zl", {desc = "Scroll right"})
vim.keymap.set({"n", "v", "i"}, "<M-S-j>", "<C-e>", {desc = "Scroll up"})
vim.keymap.set({"n", "v", "i"}, "<M-S-k>", "<C-y>", {desc = "Scroll down"})

vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Replace without overwriting yank"})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Yank to system clipboard"})

vim.keymap.set("n", "<leader>r", ":edit<CR>", {desc = "Reload file"})
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", {desc = "Close tab"})

vim.keymap.set("n", "<C-c>", "<C-w>q", {desc = "Close window"})

vim.keymap.set("n", "<leader>cn", ":cn<CR>", {desc = "Quickfix next"})
vim.keymap.set("n", "<leader>cp", ":cp<CR>", {desc = "Quickfix previous"})

vim.keymap.set("v", "<leader>ee", 'c<C-r>=<C-r>"<CR><Esc>', {desc = "Evaluate expression"})

vim.keymap.set("n", "<leader>gc", function ()
	local filename = vim.fn.expand("%:.")
	local line_number = vim.fn.line(".")
	local to_copy = "'" .. filename .. "':" .. line_number
	vim.fn.setreg("+", to_copy)
end, {desc = "Copy line with line number"})
