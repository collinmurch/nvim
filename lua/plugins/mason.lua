return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- LSPs
                "gopls",
                "ruff",
                "zls",

                -- Formatters
                "gofumpt",
                "stylua",
                "jq"
            }
        })
    end,
}
