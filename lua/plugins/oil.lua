return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	init = function()
		vim.keymap.set("n", "\\", function()
			require("oil").toggle_float()
		end, { desc = "Toggle oil" })
	end,
}
