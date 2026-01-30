return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    lazy = false, -- Necessary for `default_explorer` to work properly
    opts = {
        vim.keymap.set("n", "<leader>e", function() require('fyler').toggle() end,
            { desc = "Toggle Fyler View" })
    }
}
