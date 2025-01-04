return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			lsp_fallback = "never",
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettierd" },
			json = { "prettierd" },
			yaml = {},
			css = { "prettierd" },
			svelte = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			graphql = { "prettierd" },
			go = { "gofumpt" },
			sh = { "shfmt" },
		},
	},
	init = function()
		local format_buffer = function()
			require("conform").format({ async = true })
		end

		vim.api.nvim_create_user_command("Format", format_buffer, { desc = "Format buffer" })
		vim.api.nvim_create_user_command("Fmt", format_buffer, { desc = "Format buffer (alias)" })
	end,
}
