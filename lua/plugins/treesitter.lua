return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Safe require
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			-- Popular parsers for web, scripting, and configs
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"html",
				"javascript",
				"typescript",
				"tsx",
				"lua",
				"python",
				"rust",
				"go",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"dockerfile",
				"graphql",
				"sql",
				"java",
				"toml",
				"sh",
			},

			-- Automatically install missing parsers when entering buffer
			auto_install = true,
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			-- Incremental selection (expand/reduce selection with keys)
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},

			-- Textobjects for functions, classes, parameters
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- automatically jump forward to textobject
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sp"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>sP"] = "@parameter.inner",
					},
				},
			},

			-- Optional: Rainbow parentheses (makes nested brackets colorful)
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
