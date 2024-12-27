return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    dependencies = {
        { "echasnovski/mini.icons", opts = {} },
    },
    keys = {
        { "\\", function() require("oil").toggle_float() end, desc = "Toggle Oil file explorer" },
    },
}
