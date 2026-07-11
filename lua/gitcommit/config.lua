local M = {}

---@class GitCommitConfig
---@field model string Ollama model name
---@field ollama_url string Ollama API endpoint
---@field max_diff_chars number Maximum characters for the diff before trimming
---@field recent_commits_count number Number of recent commits to include
---@field auto boolean Auto-generate on BufEnter commit buffers
---@field keymap string Keymap to manually trigger generation
local defaults = {
	model = "qwen2.5-coder",
	ollama_url = "http://localhost:11434/api/generate",
	max_diff_chars = 12000,
	recent_commits_count = 15,
	auto = false,
	keymap = "<leader>gc",
}

---@type GitCommitConfig
M.options = vim.deepcopy(defaults)

---@param opts? GitCommitConfig
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
end

return M
