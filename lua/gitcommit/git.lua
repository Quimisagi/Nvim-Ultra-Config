local M = {}

--- Run a git command and return trimmed stdout, or nil on failure.
---@param args string[]
---@param cwd string|nil
---@return string|nil
function M.cmd(args, cwd)
	local result = vim.system(
		vim.list_extend({ "git" }, args),
		{ text = true, cwd = cwd }
	):wait()
	if result.code ~= 0 then
		return nil
	end
	return vim.trim(result.stdout)
end

--- Detect the git repository root for the given path.
---@param path string
---@return string|nil
function M.repo_root(path)
	local dir = vim.fn.fnamemodify(path, ":p:h")
	-- If we're inside .git/ (e.g. COMMIT_EDITMSG), walk up to the actual repo root.
	if dir:match("%.git$") or dir:match("%.git/") then
		dir = vim.fn.fnamemodify(dir, ":h")
	end
	local out = vim.system(
		{ "git", "-C", dir, "rev-parse", "--show-toplevel" },
		{ text = true }
	):wait()
	if out.code ~= 0 then
		return nil
	end
	return vim.trim(out.stdout)
end

--- Return staged diff --cached (full patch).
---@param root string
---@return string|nil
function M.staged_diff(root)
	return M.cmd({ "diff", "--cached" }, root)
end

--- Return staged diff --cached --stat summary.
---@param root string
---@return string|nil
function M.staged_stat(root)
	return M.cmd({ "diff", "--cached", "--stat" }, root)
end

--- Return the last N commit subjects.
---@param root string
---@param count number
---@return string[]
function M.recent_subjects(root, count)
	local out = M.cmd(
		{ "log", "--pretty=format:%s", "-n", tostring(count) },
		root
	)
	if not out then
		return {}
	end
	local subjects = {}
	for line in out:gmatch("[^\n]+") do
		table.insert(subjects, line)
	end
	return subjects
end

return M
