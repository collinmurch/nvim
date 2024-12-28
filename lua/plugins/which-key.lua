return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
	    preset = "helix",
		spec = {
			{ "<leader>g", group = "Git"},
			{ "<leader>t", group = "Test"},
			{ "<leader>d", group = "Debug"},
		},
		icons = {
            rules = false,
            mappings = false,
        },
	},
}
