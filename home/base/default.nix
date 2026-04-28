{ pkgs, ... }:

{
  imports = [
    ./nvim
    ./git
    ./zsh
    ./wezterm
    ./lazygit
  ];

  home.packages = with pkgs; [
    ansible
    terraform
    neovim
    ripgrep
    eza
    fd
    jq
    git
    gh
    docker
    docker-compose
    lazydocker
    gemini-cli
    claude-code
    ccache
    cmake
    ninja
    gettext
    python3
    go
    nodejs
    bat
    delta
    btop
    gping
    # Add other tools here
  ];

  home.stateVersion = "23.11";

  gtk = {
    enable = true;
    gtk4.theme = null;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
