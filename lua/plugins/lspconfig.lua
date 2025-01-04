return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- All keys listed will be auto-installed
		local servers = {
			ruff = {},
			zls = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						buildFlags = { "-tags=integrationtest,integration,manual,wireinject" },
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
						},
					},
				},
			},
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function()
				local map = vim.keymap.set

				-- tbd whether or not I use this
				local fix_all = function()
					local diagnostics = vim.diagnostic.get(0)

					vim.lsp.buf.code_action({
						context = {
							diagnostics = diagnostics,
							only = { "source.organizeImports", "source.fixAll" },
						},
						apply = true,
					})
				end

				local builtin = require("telescope.builtin")

				map("n", "[d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				map("n", "]d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				map("n", "gd", builtin.lsp_definitions, { desc = "Goto definitions" })
				map("n", "gr", builtin.lsp_references, { desc = "Goto references" })
				map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
				map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Perform code action" })
				map("n", "<leader>.", fix_all, { desc = "Fix all code actions" })
				map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- Must ensure mason is setup by Lazy first
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
