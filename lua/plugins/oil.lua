return {
	"stevearc/oil.nvim",
	event = "VimEnter",
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
        {
            "\\",
            function()
                require("oil").toggle_float()
            end,
            desc = "Toggle Oil file explorer",
        },
    },
}
