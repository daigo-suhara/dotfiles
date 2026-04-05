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

    # Formatters
    stylua
    black
    isort
    biome
  ];
}
