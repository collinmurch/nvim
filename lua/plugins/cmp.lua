return {
	"saghen/blink.cmp",
	version = "1.*",
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
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			prebuilt_binaries = {
				force_version = "v1.0.0",
			},
		},
	},
}
