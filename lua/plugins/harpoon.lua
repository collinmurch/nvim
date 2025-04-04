return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = false,
                sync_on_ui_close = false,
                mark_branch = false,
                mark_directory = vim.fn.stdpath("data") .. "/harpoon",
            }
        })

        local function toggle_telescope(harpoon_files)
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local conf = require("telescope.config").values
            local make_entry = require("telescope.make_entry")

            local file_paths = {}
            for i, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            pickers.new({}, {
                prompt_title = "Harpoon",
                finder = finders.new_table({
                    results = file_paths,
                    entry_maker = make_entry.gen_from_file()
                }),
                sorter = conf.file_sorter({}),
                previewer = conf.file_previewer({}),
            }):find()
        end

        local map = vim.keymap.set

        map("n", "<leader>hh", function() harpoon:list():add() end, { desc = "Add" })
        map("n", "<leader>hd", function()
            local current_file = vim.fn.expand('%:p')
            local list = harpoon:list()
            local items = list.items
            
            for i, item in ipairs(items) do
                local current_base = vim.fn.fnamemodify(current_file, ":t")
                local item_base = vim.fn.fnamemodify(item.value, ":t")
                
                if current_base == item_base then
                    table.remove(items, i)
                    return
                end
            end
        end, { desc = "Delete" })

        map("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Jump to Harpoon 1" })
        map("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Jump to Harpoon 2" })
        map("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Jump to Harpoon 3" })
        map("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Jump to Harpoon 4" })

        map("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Next" })
        map("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Previous" })

        map("n", "<leader>hc", function() harpoon:list():clear() end, { desc = "Clear all" })
        map("n", "<leader>hf", function() toggle_telescope(harpoon:list()) end, { desc = "Find" })
    end,
}
