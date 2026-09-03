{ ... }:

{
  stylix.targets.nixvim.enable = false;
  programs.nixvim.imports = [
    ./nixvim/base.nix
    ./nixvim/keymaps.nix
    ./nixvim/lsp.nix
    ./nixvim/plugins
    ./nixvim/packages.nix
  ];
}
