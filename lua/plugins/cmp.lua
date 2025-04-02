return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "default",
			mappings = {
				["<Tab>"] = "select_next",
				["<S-Tab>"] = "select_prev",
				["<CR>"] = "accept",
			},
		},
		completion = {
			documentation = { auto_show = false },
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
	opts_extend = { "sources.default" },
}
