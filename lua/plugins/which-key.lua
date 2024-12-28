return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
	    preset = "helix",
		spec = {
			{ "<leader>g", group = "Git"},
			{ "<leader>t", group = "Test"},
		},
		icons = {
            rules = false,
            mappings = false,
        },
	},
}
