-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight when copying text",
})

local whitespace_group = vim.api.nvim_create_augroup("WhitespaceHighlight", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
    group = whitespace_group,
    pattern = "*:[vV\x16]*",  -- Entering visual mode
    callback = function()
        vim.opt_local.list = true
        vim.opt_local.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
    end
})

vim.api.nvim_create_autocmd("ModeChanged", {
    group = whitespace_group,
    pattern = "[vV\x16]*:*",  -- Leaving visual mode
    callback = function()
        vim.opt_local.list = false
    end
})
