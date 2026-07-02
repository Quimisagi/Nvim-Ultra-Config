return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = { "info", "hint", "debug", "echo" },
				},
				view = "mini",
			},
		},
		views = {
			mini = { timeout = 2500 },
			notify = { timeout = 2500 },
			popup = { timeout = 2500 },
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
		},
	},
	config = function(_, opts)
		require("notify").setup({
			stages = "static",
			timeout = opts.views.notify.timeout,
		})
		require("noice").setup(opts)

		local c = {
			bg = "#212121",
			mantle = "#2E2E2E",
			surface = "#404040",
			fg = "#F7EDE1",
			dim = "#748C9A",
			muted = "#77725F",
			border = "#E6B800",
			accent = "#FFD700",
			error = "#FF4444",
			warn = "#FFD700",
			info = "#569CD6",
			hint = "#7FCF78",
		}

		vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = c.mantle, fg = c.fg })
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = c.border })
		vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = c.accent })
		vim.api.nvim_set_hl(0, "NoiceMini", { bg = c.bg, fg = c.fg })
		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = c.bg })
		vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = c.error })
		vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = c.error })
		vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = c.error })
		vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = c.warn })
		vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = c.warn })
		vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = c.warn })
		vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = c.info })
		vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = c.info })
		vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = c.info })
		vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = c.dim })
		vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = c.dim })
		vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = c.dim })
		vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = c.dim })
		vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = c.dim })
		vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = c.dim })
	end,
}
