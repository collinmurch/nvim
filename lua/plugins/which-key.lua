return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
	    preset = "helix",
		spec = {
			{ "<leader>g", group = "Git"},
		},
		icons = {
            rules = false,
            mappings = false,
        },
	},
}
