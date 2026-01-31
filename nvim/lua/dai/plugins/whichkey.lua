return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>f", group = "ファイル検索" },
			{ "<leader>g", group = "Git" },
			{ "<leader>d", group = "デバッグ" },
			{ "<leader>t", group = "ターミナル/ツール" },
			{ "<leader>T", group = "テスト" },
			{ "<leader>s", group = "ウィンドウ分割" },
			{ "<leader>n", group = "番号操作" },
			{ "<leader>h", group = "Hunk操作" },
		},
	},
}
