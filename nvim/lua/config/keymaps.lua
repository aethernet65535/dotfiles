vim.g.mapleader = " "
-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- no highlight
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
-- ZZ in V-Line Mode
vim.keymap.set("v", "ZZ", "<Esc>:wq<CR>", { desc = "Save and quit from Visual mode" })
