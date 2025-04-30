return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		-- All keys in the below table will be auto-installed
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
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						procMacro = {
							enable = true,
						},
						cargo = {
							allFeatures = true,
						},
					},
				},
			},
			vtsls = {
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			},
			eslint = {
				settings = {
					workingDirectory = { mode = "auto" },
				},
			},
			svelte = {
				settings = {
					svelte = {
						plugin = {
							typescript = {
								enable = true,
							},
							css = true,
							svelte = {
								defaultScriptLanguage = "typescript",
								useNewTransformation = true,
							},
						},
					},
				},
				filetypes = { "svelte" },
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

				map("n", "[d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				map("n", "]d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definitions" })
				map("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
				map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
				map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Perform code action" })
				map("n", "<leader>.", fix_all, { desc = "Fix all code actions" })
				map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
			end,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

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
