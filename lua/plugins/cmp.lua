return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = { "accept", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			documentation = { auto_show = true },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				lua = { "lazydev" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
				},
			},
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			use_frecency = true,
			prebuilt_binaries = {
				-- I don't know why this is needed, version should be inferred
				force_version = "v1.0.0",
			},
		},
	},
}
