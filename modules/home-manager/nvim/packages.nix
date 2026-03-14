{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Language Servers
    lua-language-server
    rust-analyzer
    nodePackages.intelephense
    nil
    clang-tools
    pyright

    # Formatters
    stylua
    black
    isort
  ];
}
