return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("mason-nvim-dap").setup()
			require("dapui").setup()
			require("dap-go").setup()
			require("nvim-dap-virtual-text").setup()

			-- Key mappings
			vim.keymap.set("n", "<leader>gt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>gc", dap.run_to_cursor, { desc = "Run to cursor" })
			vim.keymap.set("n", "?", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Evaluate under cursor" })
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<F10>", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<F11>", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<S-F11>", dap.step_back, { desc = "Step back" })
			vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })

			-- DAP listeners
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}