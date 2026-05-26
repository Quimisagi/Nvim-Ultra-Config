return {
	"tpope/vim-fugitive",
	config = function()
		vim.opt.splitright = true

		-- Keymaps for Fugitive buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				vim.keymap.set("n", "A", ":Git add -A<CR>", { buffer = true, desc = "Stage all" })
				vim.keymap.set("n", "P", ":Git push <CR>", { buffer = true, desc = "Push" })
			end,
		})

		-- Automatically close Fugitive windows when losing focus
		vim.api.nvim_create_autocmd("BufLeave", {
			pattern = "*",
			callback = function()
				if vim.bo.filetype == "fugitive" then
					-- Use vim.schedule to avoid modifying buffer state mid-leave
					vim.schedule(function()
						-- Double check we didn't accidentally close Neovim entirely
						if vim.api.nvim_buf_is_valid(0) and vim.bo.filetype ~= "fugitive" then
							pcall(vim.cmd, "cclose") -- Closes quickfix if applicable
							-- Find and close the fugitive buffer window
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								local buf = vim.api.nvim_win_get_buf(win)
								if vim.api.nvim_buf_get_option(buf, "filetype") == "fugitive" then
									vim.api.nvim_win_close(win, true)
								end
							end
						end
					end)
				end
			end,
		})
	end,
}
