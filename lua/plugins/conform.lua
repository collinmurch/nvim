return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = function(bufkey)
			local disable_filetypes = {
			    c = true,
				cpp = true,
			}

			local lsp_format_opt
			if disable_filetypes[vim.bo[bufkey].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt" },
			python = { "ruff" },
			json = { "jq" },
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
