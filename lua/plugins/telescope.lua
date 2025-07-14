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
	config = function(_, _)
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				selection_caret = "➤ ",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				path_display = { "truncate" },
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--follow", "--glob", "!.git/*" }
					end,
				},
				buffers = {
					sort_lastused = true,
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
					},
				},
			},
			extensions = {
				fzf = {
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		for _, ext in ipairs({ "fzf", "ui-select" }) do
			pcall(telescope.load_extension, ext)
		end
	end,
}
