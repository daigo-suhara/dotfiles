{ config, pkgs, ... }:

{
  # Packages to install
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
    neovim
    lazygit
    # Add other tools here
  ];

  # Symlink configuration files
  # using mkOutOfStoreSymlink so you can edit files in ~/dotfiles/nvim directly
  # without rebuilding home-manager every time.
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
  xdg.configFile."wezterm".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm";

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  imports = [
    ./zsh.nix
    ./git.nix
  ];
}
