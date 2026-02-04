-- Neo-tree Explorer
vim.keymap.set("n", "<leader>e", function()
  vim.cmd("Neotree toggle filesystem left")
end, { desc = "Neo-tree Explorer" })

-- Neo-tree Git Status
vim.keymap.set("n", "<leader>g", function()
  vim.cmd("Neotree toggle git_status left")
end, { desc = "Neo-tree Git Status" })

-- Neo-tree Buffers
vim.keymap.set("n", "<leader>b", function()
  vim.cmd("Neotree toggle buffers left")
end, { desc = "Neo-tree Buffers" })


vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {
  desc = "Toggle terminal",
})

-- Direction-specific terminals
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", {
  desc = "Toggle floating terminal",
})

vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", {
  desc = "Toggle horizontal terminal",
})

vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", {
  desc = "Toggle vertical terminal",
})

--Aura
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial" })

--Buffer navigation

vim.keymap.set("n", "<M-H>", "<C-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<M-J>", "<C-w>j", { desc = "Focus down split" })
vim.keymap.set("n", "<M-K>", "<C-w>k", { desc = "Focus up split" })
vim.keymap.set("n", "<M-L>", "<C-w>l", { desc = "Focus right split" })


--Telescope

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Buffers" })
