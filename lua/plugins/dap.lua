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
			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dg", dap.run_to_cursor, { desc = "Run to cursor" })
			vim.keymap.set("n", "<leader>d.", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Evaluate under cursor" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<leader>dx", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>db", dap.step_back, { desc = "Step back" })
			vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })

			vim.fn.sign_define('DapBreakpoint', { text='◌', texthl='', linehl='', numhl='' })

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
