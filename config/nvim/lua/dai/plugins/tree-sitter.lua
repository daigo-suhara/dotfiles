return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter").setup({
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            ensure_installed = {
                "c",
                "cpp",
                "css",
                "dart",
                "dockerfile",
                "go",
                "html",
                "json",
                "javascript",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "typescript",
                "vim",
            },
        })
    end,
}
