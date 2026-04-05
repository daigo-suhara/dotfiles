{ pkgs, ... }:

{
  imports = [
    ./nvim
    ./git
    ./zsh
    ./wezterm
  ];

  home.packages = with pkgs; [
    neovim
    ripgrep
    eza
    fd
    jq
    git
    gh
    lazygit
    docker
    docker-compose
    lazydocker
    gemini-cli
    ccache
    cmake
    ninja
    gettext
    python3
    bat
    btop
    gping
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
