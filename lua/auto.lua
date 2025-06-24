-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
		-- Only copy to system clipboard for yank operations (not delete/cut)
		if vim.v.event.operator == "y" then
			vim.fn.setreg("+", vim.fn.getreg('"'))
		end
	end,
	desc = "Highlight when copying text and sync yanks to system clipboard",
})
