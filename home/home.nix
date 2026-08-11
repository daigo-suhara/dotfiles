{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./nvim.nix
    ./wezterm.nix
    ./yazi.nix
    ./lazygit.nix
  ];

  gtk.enable = true;
  home.sessionVariables.EDITOR = "nvim";
  programs.home-manager.enable = true;

  home.file."Library/Fonts/Cica".source = "${import ../cica-font.nix { inherit pkgs; }}/share/fonts/truetype/cica";
  home.stateVersion = "23.11";
}
