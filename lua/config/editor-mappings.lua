--Buffer navigation

vim.keymap.set("n", "<M-H>", "<C-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<M-J>", "<C-w>j", { desc = "Focus down split" })
vim.keymap.set("n", "<M-K>", "<C-w>k", { desc = "Focus up split" })
vim.keymap.set("n", "<M-L>", "<C-w>l", { desc = "Focus right split" })

--Cut
vim.keymap.set("n", "m", "d", {
	desc = "Cut",
})

vim.keymap.set("x", "m", "d", {
	desc = "Cut (visual)",
})

vim.keymap.set("n", "mm", "dd", {
	desc = "Cut line",
})

vim.keymap.set("n", "M", "D", {
	desc = "Cut to end of line",
})

--Window nabigation


vim.keymap.set("n", "<Leader>h", "<C-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<Leader>j", "<C-w>j", { desc = "Focus down split" })
vim.keymap.set("n", "<Leader>k", "<C-w>k", { desc = "Focus up split" })
vim.keymap.set("n", "<Leader>l", "<C-w>l", { desc = "Focus right split" })
