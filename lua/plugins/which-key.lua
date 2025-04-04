return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>g", group = "Git" },
			{ "<leader>t", group = "Test" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>f", desc = "Files" },
			{ "<leader>b", desc = "Buffers" },
			{ "<leader>s", desc = "Symbols" },
			{ "<leader>o", desc = "Diagnostics" },
			{ "<leader>/", desc = "Search workspace" },
			{ "<leader>?", desc = "Search buffers" },
			{ "<leader>a", desc = "Code action" },
			{ "<leader>r", desc = "Rename" },
			{ "<leader>.", desc = "Fix all" },
			{ "<leader>,", desc = "Toggle whitespace" },
			{ "<leader>c", desc = "Comment" },
			{ "<leader>p", desc = "Paste" },
		},
		icons = {
			rules = false,
			mappings = false,
		},
	},
}

