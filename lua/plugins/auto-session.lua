return {
	"rmagatti/auto-session",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("auto-session").setup({
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = {
				"~/",
				"~/Downloads",
				"/",
			},
		})

		-- Telescope integration
		require("telescope").load_extension("session-lens")
	end,
}
