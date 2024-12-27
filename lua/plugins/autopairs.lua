return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {},
	init = function()
		-- Selecting a completion closes the "("
		require("cmp").event:on(
		    "confirm_done",
			require("nvim-autopairs.completion.cmp").on_confirm_done()
		)
	end,
}
