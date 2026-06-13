return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
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
