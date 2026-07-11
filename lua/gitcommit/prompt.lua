local M = {}

--- Build the LLM prompt from git context.
---@param recent_commits string[]
---@param diff_stat string
---@param diff string
---@return string
function M.build(recent_commits, diff_stat, diff)
	local lines = {}

	table.insert(lines, "You are a Git commit message author.")
	table.insert(lines, "")
	table.insert(lines, "Rules:")
	table.insert(lines, "- Follow the style of the existing commit messages below.")
	table.insert(lines, "- Return ONLY the commit subject line (first line).")
	table.insert(lines, "- Use the imperative mood (e.g. \"Add\", \"Fix\", \"Remove\").")
	table.insert(lines, "- Keep it under 72 characters.")
	table.insert(lines, "- Do NOT include any explanation, markdown, or <think> tags.")
	table.insert(lines, "")

	if #recent_commits > 0 then
		table.insert(lines, "Existing commit messages (most recent first):")
		table.insert(lines, "```")
		for _, msg in ipairs(recent_commits) do
			table.insert(lines, msg)
		end
		table.insert(lines, "```")
		table.insert(lines, "")
	end

	table.insert(lines, "Staged changes summary:")
	table.insert(lines, "```")
	table.insert(lines, diff_stat)
	table.insert(lines, "```")
	table.insert(lines, "")

	table.insert(lines, "Full staged diff:")
	table.insert(lines, "```diff")
	table.insert(lines, diff)
	table.insert(lines, "```")
	table.insert(lines, "")

	table.insert(lines, "Commit subject:")

	return table.concat(lines, "\n")
end

return M
