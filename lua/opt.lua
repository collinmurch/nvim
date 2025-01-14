-- Map <leader> to space bar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers
vim.opt.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Default tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn for gitsigns, breakpoints, etc. on
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 200

-- Timeout len should be long for some plugins (mini.surround, etc.)
vim.opt.timeoutlen = 500

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace characters, controlled by a keybinding
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Go to previous/next line with h,l,left arrow and right arrow
vim.opt.whichwrap:append("<>[]hl")
