return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'xiyaowong/transparent.nvim' },
    lazy = false,
    config = function()
        require("bufferline").setup {
            options = {
                separator_style = { " ", " " },
            },
            highlights = {}
        }
        vim.g.transparent_groups = vim.list_extend(
            vim.g.transparent_groups or {},
            vim.tbl_map(function(v)
                return v.hl_group
            end, vim.tbl_values(require('bufferline.config').highlights))
        )
    end
}
