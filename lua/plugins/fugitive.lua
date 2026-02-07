return {
	"tpope/vim-fugitive",
	config = function()
		vim.opt.splitright = true

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				vim.keymap.set("n", "A", ":Git add -A<CR>", { buffer = true, desc = "Stage all" })
			end,
		})
	end,
}
