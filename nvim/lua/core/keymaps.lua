vim.g.mapleader = " "

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- jk = esc
vim.keymap.set("i", "jk", "<ESC>")

-- no highlight
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
