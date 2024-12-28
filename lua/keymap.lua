local map = vim.keymap.set

map('n', 'U', '<C-R>', { noremap = true, desc = "Redo"})

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>c", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>c", "gc", { desc = "Toggle comment", remap = true })

map("x", "<leader>p", [["_dP]], { desc = "Paste" })

map("n", "<leader>y", function()
	vim.fn.setreg("+", vim.fn.getreg('"'))
	vim.api.nvim_out_write("Copied to system clipboard\n")
end, { desc = "Copy selection to clipboard" })

map('n', '<leader>,', function()
    vim.opt.list = not vim.opt.list._value
end, { desc = 'Toggle whitespace characters' })
