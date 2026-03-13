{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Language Servers
    lua-language-server
    rust-analyzer
    nodePackages.intelephense
    nil # Nix LSP
    
    # Formatters
    stylua
  ];
}
