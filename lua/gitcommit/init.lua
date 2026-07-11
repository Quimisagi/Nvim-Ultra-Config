local config = require("gitcommit.config")
local git = require("gitcommit.git")
local prompt = require("gitcommit.prompt")
local ollama = require("gitcommit.ollama")

local M = {}

--- Trim a string to a maximum character length, appending an indicator.
---@param text string
---@param max number
---@return string
local function trim_diff(text, max)
	if #text <= max then
		return text
	end
	return text:sub(1, max) .. "\n-- diff truncated --"
end

--- Collect all git context and generate a commit message.
--- Runs entirely asynchronously; Neovim never blocks.
function M.generate()
	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	if filepath == "" then
		vim.notify("gitcommit: no file path for current buffer", vim.log.levels.WARN)
		return
	end

	local root = git.repo_root(filepath)
	if not root then
		vim.notify("gitcommit: not inside a git repository", vim.log.levels.WARN)
		return
	end

	local diff_stat = git.staged_stat(root)
	if not diff_stat or diff_stat == "" then
		vim.notify("gitcommit: no staged changes found", vim.log.levels.WARN)
		return
	end

	local diff_raw = git.staged_diff(root)
	if not diff_raw or diff_raw == "" then
		vim.notify("gitcommit: staged diff is empty", vim.log.levels.WARN)
		return
	end

	local diff = trim_diff(diff_raw, config.options.max_diff_chars)
	local recent = git.recent_subjects(root, config.options.recent_commits_count)

	local prompt_text = prompt.build(recent, diff_stat, diff)

	vim.notify("gitcommit: generating commit message...", vim.log.levels.INFO)

	ollama.generate(prompt_text, function(result, err)
		if not result and not err then
			-- Ollama not reachable; silently skip.
			return
		end
		if err then
			vim.notify("gitcommit: " .. err, vim.log.levels.ERROR)
			return
		end

		-- Split into lines and insert into buffer at cursor.
		local lines = vim.split(result, "\n", { plain = true })
		-- Only the subject goes on line 1; strip any body the model may have added.
		lines = { lines[1] }

		local row = vim.api.nvim_win_get_cursor(0)[1]
		-- If the cursor is on the comment block, insert before it.
		vim.api.nvim_buf_set_lines(bufnr, row - 1, row - 1, false, lines)
		vim.notify("gitcommit: message inserted", vim.log.levels.INFO)
	end)
end

--- Setup the plugin.
---@param opts? GitCommitConfig
function M.setup(opts)
	config.setup(opts)

	-- Keymap always available in commit buffers.
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "gitcommit",
		callback = function(ev)
			vim.keymap.set("n", config.options.keymap, function()
				M.generate()
			end, { buffer = ev.buf, desc = "Generate commit message with LLM" })

			-- Auto-generate immediately when the commit buffer opens.
			if config.options.auto then
				vim.schedule(function()
					M.generate()
				end)
			end
		end,
	})

	vim.api.nvim_create_user_command("GitCommitGenerate", function()
		M.generate()
	end, { desc = "Generate a commit message with the LLM" })
end

return M
