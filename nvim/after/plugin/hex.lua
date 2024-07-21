local hex = require("hex")
hex.setup()

vim.keymap.set("n", "<leader>th", hex.toggle, { desc = "Toggle hex view" })

