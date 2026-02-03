{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    ripgrep
    fd
    jq
    git
    lazygit
    docker
    docker-compose
    lazydocker
    gemini-cli
    gcc
    bat
    rustup
    # Add other tools here
  ];

  home.stateVersion = "23.11";

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
