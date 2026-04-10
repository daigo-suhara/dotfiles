{ ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      customCommands = [
        {
          key = "c";
          context = "files";
          description = "Conventional commit (テンプレートに沿ったコミット)";
          prompts = [
            {
              type = "menu";
              title = "コミットの種類を選択";
              key = "Type";
              options = [
                { name = "feat";     description = "新機能";                             value = "feat"; }
                { name = "fix";      description = "バグ修正";                           value = "fix"; }
                { name = "docs";     description = "ドキュメントのみの変更";             value = "docs"; }
                { name = "refactor"; description = "バグ修正も機能追加も行わないコード変更"; value = "refactor"; }
                { name = "test";     description = "テストの追加・修正";                 value = "test"; }
                { name = "perf";     description = "パフォーマンス向上";                 value = "perf"; }
                { name = "style";    description = "空白・セミコロン・字下げなど";       value = "style"; }
                { name = "build";    description = "ビルドシステム・外部依存の変更";     value = "build"; }
                { name = "ci";       description = "CI 関連の変更";                      value = "ci"; }
                { name = "chore";    description = "依存性アップデートなど";             value = "chore"; }
              ];
            }
            {
              type = "input";
              title = "スコープ (省略可 — 影響範囲・パッケージ等)";
              key = "Scope";
              initialValue = "";
            }
            {
              type = "input";
              title = "概要 (現在形・小文字・ピリオドなし・50文字以内)";
              key = "Summary";
            }
          ];
          command = ''sh -c 'if [ -n "{{.Form.Scope}}" ]; then git commit -m "{{.Form.Type}}({{.Form.Scope}}): {{.Form.Summary}}"; else git commit -m "{{.Form.Type}}: {{.Form.Summary}}"; fi' '';
        }
      ];
    };
  };
}
