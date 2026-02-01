{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fish
    ripgrep
    fd
    jq
    git
    neovim
    lazygit
    gemini-cli
    gcc
    # Add other tools here
  ];

  home.stateVersion = "23.11";

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  programs.zsh.enable = false;
  programs.fish.enable = true;

}
