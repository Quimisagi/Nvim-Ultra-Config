local config = require("gitcommit.config")

local M = {}

--- Strip <think>...</think> blocks and surrounding whitespace from the response.
---@param text string
---@return string
local function strip_reasoning(text)
	local cleaned = text:gsub("<think>.-</think>", "")
	cleaned = cleaned:gsub("%s+", " ")
	return vim.trim(cleaned)
end

--- Check whether Ollama is reachable (fast, ~1s timeout).
---@param callback fun(ok: boolean)
function M.is_running(callback)
	local base = config.options.ollama_url:match("^(http://[^/]+)")
	vim.system(
		{ "curl", "-s", "-o", "/dev/null", "-m", "2", base .. "/api/tags" },
		{ text = true },
		function(out)
			vim.schedule(function()
				callback(out.code == 0)
			end)
		end
	)
end

--- Send a prompt to the local Ollama server asynchronously.
--- Silently skips if Ollama is not reachable.
---@param prompt string
---@param callback fun(result: string|nil, err: string|nil)
function M.generate(prompt, callback)
	M.is_running(function(running)
		if not running then
			callback(nil, nil)
			return
		end

		local payload = vim.json.encode({
			model = config.options.model,
			prompt = prompt,
			stream = false,
		})

		local cmd = { "curl", "-s", "-X", "POST", config.options.ollama_url }
		vim.list_extend(cmd, { "-H", "Content-Type: application/json", "-d", payload })

		vim.system(cmd, { text = true }, function(out)
			vim.schedule(function()
				if out.code ~= 0 then
					callback(nil, "curl failed (exit " .. out.code .. "): " .. (out.stderr or ""))
					return
				end

				local ok, decoded = pcall(vim.json.decode, out.stdout)
				if not ok or not decoded.response then
					callback(nil, "Failed to parse Ollama response: " .. (out.stdout or ""))
					return
				end

				local response = strip_reasoning(decoded.response)
				if response == "" then
					callback(nil, "Ollama returned an empty response")
					return
				end

				callback(response, nil)
			end)
		end)
	end)
end

return M
