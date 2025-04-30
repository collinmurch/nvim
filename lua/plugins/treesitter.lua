return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
	    -- Doesn't automatically install for Svelte Typescript files, breaking highlighting
	    ensure_installed = { 'typescript' },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		auto_install = true,
	},
}
