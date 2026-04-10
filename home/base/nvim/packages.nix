{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Language Servers
    lua-language-server
    rust-analyzer
    intelephense
    nil
    clang-tools
    pyright
    vtsls
    typescript
    vscode-langservers-extracted
    emmet-ls
    gopls
    delve

    # Formatters
    stylua
    black
    isort
    biome
    gotools
  ];
}
