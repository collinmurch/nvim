return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "echasnovski/mini.icons" },
	},
	keys = {
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Open file picker" },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Open buffer picker" },
        { "<leader>s", "<cmd>Telescope treesitter<cr>", desc = "Open symbol picker" },
        { "<leader>o", "<cmd>Telescope diagnostics<cr>", desc = "Open diagnostic picker" },
        { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Global search in workspace folder" },
        {
            "<leader>?",
            function()
                require("telescope.builtin").live_grep({
                    grep_open_files = true,
                    prompt_title = "Live grep in buffers",
                })
            end,
            desc = "Search in buffers",
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)

        for _, ext in ipairs({ "fzf", "ui-select" }) do
            pcall(telescope.load_extension, ext)
        end
    end,
}
