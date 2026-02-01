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
    gcc
    # Add other tools here
  ];

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Auto Backup file
  home.backupFileExtension = "backup";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
