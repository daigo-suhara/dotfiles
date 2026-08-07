vim.g.toggleterm_initialized = false

return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return math.floor(vim.o.lines * 0.35)
                elseif term.direction == "vertical" then
                    return math.floor(vim.o.columns * 0.4)
                end
            end,
            start_in_insert = true,
            direction = "float",
            open_mapping = [[<c-w>]],
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
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,

    keys = {
        {
            "<leader>t",
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
