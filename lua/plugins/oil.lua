return {
	"stevearc/oil.nvim",
	event = "VimEnter",
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
		float = {
			padding = 5,
			max_width = 90,
		},
		win_options = {
			wrap = true,
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
