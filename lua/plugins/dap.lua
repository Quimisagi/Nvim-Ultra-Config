-- lua/plugins/dap.lua
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui", -- optional UI for debugging
			"theHamsta/nvim-dap-virtual-text", -- shows variable values inline
			"nvim-neotest/nvim-nio",
		},
		cmd = { "DapContinue", "DapToggleBreakpoint", "DapStepOver" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local mason_dap = require("mason-nvim-dap")

			-- Mason DAP setup
			mason_dap.setup({
				ensure_installed = {
					"python", -- debugpy
					"node2", -- JS/TS Node debugger
					"codelldb", -- C, C++, Rust
				},
				automatic_installation = true,
			})

			-- DAP UI setup
			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			-- Open/close UI automatically
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Python
			dap.adapters.python = {
				type = "executable",
				command = "python",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return vim.fn.input("Path to python: ", vim.fn.getcwd() .. "/venv/bin/python", "file")
					end,
				},
			}

			-- JavaScript / TypeScript (Node)
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
			}

			dap.configurations.javascript = {
				{
					type = "node2",
					request = "launch",
					name = "Launch JS file",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
				},
			}

			dap.configurations.typescript = {
				{
					type = "node2",
					request = "launch",
					name = "Launch TS file",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
				},
			}

			-- C / C++ / Rust (codelldb)
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Optional keymaps
			-- local map = vim.keymap.set
			-- map("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
			-- map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
			-- map("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
			-- map("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
			-- map("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
			-- map("n", "<leader>B", function()
			--   dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			-- end, { desc = "DAP: Conditional Breakpoint" })
			-- map("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
			-- map("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })
		end,
	},
}
