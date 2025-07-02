return {
    "stevearc/conform.nvim",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "whoissethdaniel/mason-tool-installer.nvim",
    },
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    init = function()
        -- All keys listed will be auto-installed
        local formatters_by_ft = {
            lua             = { "stylua" },
            svelte          = { "svelte-language-server" },
            css             = { "prettierd" },
            json            = { "prettierd" },
            yaml            = {},
            javascript      = { "eslint_d" },
            typescript      = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            markdown        = { "prettierd" },
            graphql         = { "prettierd" },
            sh              = { "shfmt" },
        }

        local formatters = {}
        for _, formatter_list in pairs(formatters_by_ft) do
            for _, formatter in ipairs(formatter_list) do
                if not vim.tbl_contains(formatters, formatter) then
                    table.insert(formatters, formatter)
                end
            end
        end

        require("mason-tool-installer").setup({
            ensure_installed = formatters,
        })

        require("conform").setup({
            notify_on_error = false,
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 1000,
            },
            formatters_by_ft = formatters_by_ft,
        })

        local format_buffer = function()
            require("conform").format({ async = true })
        end

        -- Create user commands to trigger formatting
        vim.api.nvim_create_user_command("Format", format_buffer, { desc = "Format buffer" })
        vim.api.nvim_create_user_command("Fmt", format_buffer, { desc = "Format buffer (alias)" })
    end,
}
