{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./nixvim.nix
    ./wezterm.nix
    ./vscode.nix
    ./yazi.nix
    ./lazygit.nix
  ];

  gtk.enable = true;
  home.sessionVariables.EDITOR = "nvim";
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
