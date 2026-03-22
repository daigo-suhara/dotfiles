{ pkgs, ... }:

{
  # GNOME拡張機能のパッケージ導入
  home.packages = with pkgs.gnomeExtensions; [
    just-perfection
    blur-my-shell
    vitals
    appindicator
    dash-to-dock # もしツールバーを合体させたいなら dash-to-panel もおすすめ
  ];

  # dconf を通じて設定を管理
  dconf.settings = {
    # 拡張機能を有効化
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "just-perfection-desktop@just-perfection"
        "blur-my-shell@aunetx"
        "vitals@corecoding.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-dock@micxgx.gmail.com"
      ];
    };

    # Just Perfection の設定例 (ツールバーなどのカスタマイズ)
    "org/gnome/shell/extensions/just-perfection" = {
      panel = true; # パネル（ツールバー）の表示設定
      panel-size = 32; # パネルの高さ
      # 時計を中央から右に寄せるなどの設定もここで行えます
    };

    # Blur my Shell の設定例
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      sigma = 30; # ぼかしの強さ
    };
  };
}
