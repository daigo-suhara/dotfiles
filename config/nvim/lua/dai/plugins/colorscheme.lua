local ColorScheme = "github"

------------ config --------------

if ColorScheme == "github" then
    return {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({})
            vim.cmd("colorscheme github_dark_default")
        end,
    }
end

if ColorScheme == "molokai" then
    return {
        "tomasr/molokai",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme molokai]])
        end,
    }
end

if ColorScheme == "nightfox" then
    return {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end,
    }
end

if ColorScheme == "tokyonight" then
    return {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme tokyonight-storm]])
        end,
    }
end

if ColorScheme == "iceberg" then
    return {
        "cocopon/iceberg.vim",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme iceberg]])
        end,
    }
end
