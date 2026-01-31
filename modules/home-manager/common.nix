{ pkgs, ... }:

{
  # Packages to install
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    git
    neovim
    lazygit
    gemini-cli
    # Add other tools here
  ];

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
