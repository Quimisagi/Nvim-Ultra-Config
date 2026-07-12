return {
	{
		dir = vim.fn.stdpath("config") .. "/lua/gitcommit",
		name = "gitcommit",
		dependencies = {},
		ft = "gitcommit",
		cmd = "GitCommitGenerate",
		config = function()
			require("gitcommit").setup({
				model = "qwen2.5-coder:3b",
				ollama_url = "http://localhost:11434/api/generate",
				max_diff_chars = 12000,
				recent_commits_count = 15,
				auto = true,
				keymap = "<leader>gc",
			})
		end,
	},
}
