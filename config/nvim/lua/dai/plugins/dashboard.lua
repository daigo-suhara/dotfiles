return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                header = {
                    '',
                    ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
                    ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
                    ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
                    ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
                    ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
                    ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
                },
                footer = {},
                shortcut = {},
                packages = { enable = true },
                project = { enable = true },
            },
        }
    end,
    dependencies = {
        {
            'echasnovski/mini.icons',
            config = function()
                require('mini.icons').setup()
                require('mini.icons').mock_nvim_web_devicons()
            end,
        },
    },
}
