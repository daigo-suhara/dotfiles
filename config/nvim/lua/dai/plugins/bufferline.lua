return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'xiyaowong/transparent.nvim' },
    lazy = false,
    config = function()
        require("bufferline").setup {}
    end
}
