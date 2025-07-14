return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	keys = {
		{ "<leader>f", "<cmd>FzfLua files<cr>", desc = "Open file picker" },
		{ "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Open buffer picker" },
		{ "<leader>s", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Open symbol picker" },
		{ "<leader>o", "<cmd>FzfLua diagnostics_document<cr>", desc = "Open diagnostic picker" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Global search in workspace folder" },
		{ "<leader>?", "<cmd>FzfLua grep_curbuf<cr>", desc = "Search in current buffer" },
	},
	config = function()
		local fzf = require("fzf-lua")
		
		fzf.setup({
			"max-perf",
			winopts = {
				height = 0.80,
				width = 0.87,
				preview = {
					layout = "horizontal",
					horizontal = "right:55%",
				},
			},
			keymap = {
				builtin = {
					["<C-j>"] = "down",
					["<C-k>"] = "up",
				},
				fzf = {
					["ctrl-j"] = "down",
					["ctrl-k"] = "up",
					["ctrl-q"] = "select-all+accept",
				},
			},
			files = {
				rg_opts = "--files --hidden --glob '!.git/*'",
				fd_opts = "--type f --hidden --follow --exclude .git",
			},
			grep = {
				rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case",
			},
			buffers = {
				sort_lastused = true,
				actions = {
					["ctrl-d"] = function(selected)
						for _, sel in ipairs(selected) do
							local bufnr = tonumber(sel:match("^%s*(%d+)"))
							if bufnr then
								vim.api.nvim_buf_delete(bufnr, { force = true })
							end
						end
					end,
				},
			},
		})

		-- Set up ui-select integration
		fzf.register_ui_select()
	end,
}
