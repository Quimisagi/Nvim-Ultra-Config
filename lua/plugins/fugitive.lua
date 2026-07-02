return {
	"tpope/vim-fugitive",
	config = function()
		vim.opt.splitright = true

		-- Keymaps for Fugitive buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				vim.keymap.set("n", "A", ":Git add -A<CR>", { buffer = true, desc = "Stage all" })
				vim.keymap.set("n", "P", function()
					local bufnr = vim.api.nvim_create_buf(false, true)
					vim.bo[bufnr].filetype = "gitpush"
					local win = vim.api.nvim_open_win(bufnr, true, {
						relative = "editor",
						width = 60,
						height = 8,
						row = math.floor(vim.o.lines * 0.4),
						col = math.floor(vim.o.columns * 0.3),
						style = "minimal",
						border = "rounded",
						title = " Git Push ",
					})
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Running git push..." })

					local lines = {}
					vim.fn.jobstart({ "git", "push" }, {
						on_stdout = function(_, data, _)
							if not data then return end
							for _, line in ipairs(data) do
								if line ~= "" then table.insert(lines, line) end
							end
							if #lines > 0 and vim.api.nvim_buf_is_valid(bufnr) then
								vim.schedule(function()
									vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
								end)
							end
						end,
						on_stderr = function(_, data, _)
							if not data then return end
							for _, line in ipairs(data) do
								if line ~= "" then table.insert(lines, line) end
							end
							if #lines > 0 and vim.api.nvim_buf_is_valid(bufnr) then
								vim.schedule(function()
									vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
								end)
							end
						end,
						on_exit = function(_, exit_code)
							vim.schedule(function()
								if not vim.api.nvim_buf_is_valid(bufnr) then return end
								table.insert(lines, "")
								if exit_code == 0 then
									table.insert(lines, "✓ Push successful")
								else
									table.insert(lines, "✗ Push failed (exit: " .. exit_code .. ")")
								end
								vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
								vim.defer_fn(function()
									if vim.api.nvim_win_is_valid(win) then
										vim.api.nvim_win_close(win, true)
									end
								end, 3000)
							end)
						end,
					})
				end, { buffer = true, desc = "Push (float notification)" })
			end,
		})

		-- Open commit message buffers in a floating window
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "gitcommit",
			callback = function()
				vim.schedule(function()
					local win = vim.api.nvim_get_current_win()
					vim.api.nvim_win_set_config(win, {
						relative = "editor",
						width = math.floor(vim.o.columns * 0.8),
						height = math.floor(vim.o.lines * 0.8),
						row = math.floor(vim.o.lines * 0.1),
						col = math.floor(vim.o.columns * 0.1),
						style = "minimal",
						border = "rounded",
					})
				end)
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
						local target_ft = vim.bo.filetype
						if vim.api.nvim_buf_is_valid(0) and target_ft ~= "fugitive" and target_ft ~= "gitcommit" and target_ft ~= "gitpush" then
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
