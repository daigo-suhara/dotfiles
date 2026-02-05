{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    ripgrep
    eza
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
    btop
    gping
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
