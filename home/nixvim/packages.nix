{ pkgs, ... }:

{
  extraPackages = with pkgs; [ lua-language-server rust-analyzer nil pyright vtsls vscode-langservers-extracted emmet-ls gopls clang-tools biome stylua go ];
}
