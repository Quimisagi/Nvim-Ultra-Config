return {
	"tpope/vim-fugitive",
	config = function()
		vim.opt.splitright = true

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				vim.keymap.set("n", "A", ":Git add -A<CR>", { buffer = true, desc = "Stage all" })
				vim.keymap.set("n", "P", ":Git push <CR>", { buffer = true, desc = "Push" })
			end,
		})
	end,
}
