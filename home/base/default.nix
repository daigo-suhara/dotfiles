{ ... }:

{
  imports = [
    ./packages.nix
    ./nvim
    ./git
    ./zsh
    ./wezterm
    ./yazi
    ./lazygit
  ];

  gtk = {
    enable = true;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
