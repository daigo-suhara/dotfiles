vim.g.toggleterm_initialized = false

return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = 150,
            on_open = function()
                vim.cmd([[startinsert]])
            end,
            direction = "float",
        })
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
        local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        function _lazydocker_toggle()
            lazydocker:toggle()
        end

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,

    keys = {
        {
            "<leader>tt",
            function()
                require("toggleterm").toggle(0)
            end,
            noremap = true,
            desc = "ターミナル",
        },
        {
            "<leader>lg",
            function()
                _lazygit_toggle()
            end,
            noremap = true,
            desc = "Git操作パネル",
        },
        {
            "<leader>ld",
            function()
                _lazydocker_toggle()
            end,
            noremap = true,
            desc = "Docker操作パネル",
        },
    },
}
