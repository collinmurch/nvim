return {
	"olivercederborg/poimandres.nvim",
	priority = 1000,
	opts = {
		disable_background = true,
		disable_float_background = true,
	},
	init = function()
		vim.cmd.colorscheme("poimandres")
		vim.cmd.highlight("Comment cterm=italic gui=italic")
	end,
}
