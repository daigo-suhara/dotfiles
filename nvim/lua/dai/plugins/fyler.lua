return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    lazy = false, -- Necessary for `default_explorer` to work properly
    opts = function()
        local fyler = require('fyler')
        vim.keymap.set("n", "<leader>e", function()
            fyler.toggle({ dir = ".", kind = "split_right" })
        end, { desc = "Toggle fyler View" })
    end,
}
