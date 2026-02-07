-- lua/plugins/which-key.lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 300,
		icons = {
			mappings = true,
			keys = {
				Esc = "Esc",
				CR = "↵",
				Tab = "⇥",
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Optional: register groups
		wk.add({
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>b", group = "buffer" },
		})
	end,
}
