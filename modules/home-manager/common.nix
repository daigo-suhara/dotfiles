{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    git
    neovim
    lazygit
    lazydocker
    gemini-cli
    gcc
    docker
    bat
    nil # Nix Language Server
    #rust-bin.stable.latest.default
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
