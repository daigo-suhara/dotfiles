return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        win = {
            border = "rounded",
        },
        spec = {
            { "<leader>f", group = "ファイル検索" },
            { "<leader>ff", desc = "cwd内のファイル検索" },
            { "<leader>fr", desc = "履歴からファイル検索" },
            { "<leader>fs", desc = "ファイル内情報から検索" },
            { "<leader>fc", desc = "カーソル文字で検索" },

            { "<leader>d", group = "デバッグ" },
            { "<leader>ds", desc = "ブレークポイントを設置" },
            { "<leader>dg", desc = "カーソル位置でデバッグ" },
            { "<leader>dc", desc = "デバッグを開始/再開" },
            { "<leader>di", desc = "ステップイン" },
            { "<leader>do", desc = "ステップオーバー" },
            { "<leader>dO", desc = "ステップアウト" },
            { "<leader>db", desc = "ステップバック" },
            { "<leader>dr", desc = "再度デバッグを開始" },

            { "<leader>t", group = "ターミナル/ツール" },
            { "<leader>th", desc = "インレイヒント切替" },
            { "<leader>to", desc = "新しいタブ" },
            { "<leader>tx", desc = "タブを閉じる" },
            { "<leader>tn", desc = "次のタブ" },
            { "<leader>tp", desc = "前のタブ" },
            { "<leader>tf", desc = "現在のバッファを新しいタブで開く" },

            { "<leader>T", group = "テスト" },
            { "<leader>Tn", desc = "カーソルのテストを実行" },
            { "<leader>Tf", desc = "テストファイルを実行" },
            { "<leader>Ts", desc = "テストスイート全体を実行" },
            { "<leader>Tl", desc = "最後のテストを実行" },
            { "<leader>Tg", desc = "最後にテストを実行したファイルにアクセス" },

            { "<leader>s", group = "ウィンドウ分割" },
            { "<leader>sv", desc = "垂直分割" },
            { "<leader>sh", desc = "水平分割" },
            { "<leader>se", desc = "分割サイズを揃える" },
            { "<leader>sx", desc = "分割を閉じる" },

            { "<leader>n", group = "番号操作" },
            { "<leader>nh", desc = "検索ハイライトを消去" },

            { "<leader>c", group = "コード操作" },
            { "<leader>ca", desc = "コードアクション" },
            { "<leader>cd", desc = "ドキュメント表示" },
            { "<leader>cp", desc = "定義元を表示" },
            { "<leader>cg", desc = "定義元へ移動" },
            { "<leader>cr", desc = "名前変更" },
            { "<leader>ce", desc = "診断を表示" },
            { "<leader>cn", desc = "次の警告へ" },
            { "<leader>cN", desc = "前の警告へ" },

            { "<leader>w", group = "ワークスペース" },
            { "<leader>ws", desc = "ワークスペースシンボル" },

            { "<leader>+", desc = "数値を増加" },
            { "<leader>-", desc = "数値を減少" },

            { "<leader>e", desc = "ファイルエクスプローラー" },
            { "<leader>mp", desc = "フォーマット" },
            { "<leader>rn", desc = "名前変更" },

            { "gr", desc = "参照へ移動" },
            { "gI", desc = "実装へ移動" },
            { "gd", desc = "定義へ移動" },
            { "gD", desc = "宣言へ移動" },
            { "gt", desc = "型定義へ移動" },
        },
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#58A6FF" })
        require("which-key").setup(opts)
    end,
}