return {
    'nvim-lualine/lualine.nvim',
    dependencies = { "echasnovski/mini.icons" },
    opts = {
        sections = {
            -- No diff or fileformat sections
            lualine_b = {'branch', 'diagnostics'},
            lualine_x = {'encoding', 'filetype'}
        }
    },
    init = function()
        require("mini.icons").mock_nvim_web_devicons()
	end
}
