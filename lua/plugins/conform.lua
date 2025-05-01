return {
	"stevearc/conform.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"whoissethdaniel/mason-tool-installer.nvim",
	},
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	init = function()
		-- All keys listed will be auto-installed
		-- We handle JS/TS/JSX/TSX with eslint code actions in lspconfig.lua
		local formatters_by_ft = {
			lua = { "stylua" },
			css = { "biome" },
			json = { "biome" },
			yaml = {},
			typescript = {},
			javascript = {},
			javascriptreact = {},
			typescriptreact = {},
			markdown = { "biome" },
			svelte = { "svelte-language-server" },
			graphql = { "biome" },
			sh = { "shfmt" },
		}

		local formatters = {}
		for _, formatter_list in pairs(formatters_by_ft) do
			for _, formatter in ipairs(formatter_list) do
				if not vim.tbl_contains(formatters, formatter) then
					table.insert(formatters, formatter)
				end
			end
		end

		require("mason-tool-installer").setup({
			ensure_installed = formatters,
		})

		require("conform").setup({
			notify_on_error = false,
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			formatters_by_ft = formatters_by_ft,
		})

		local format_buffer = function()
			require("conform").format({ async = true })
		end

		-- Create user commands to trigger formatting
		vim.api.nvim_create_user_command("Format", format_buffer, { desc = "Format buffer" })
		vim.api.nvim_create_user_command("Fmt", format_buffer, { desc = "Format buffer (alias)" })
	end,
}
