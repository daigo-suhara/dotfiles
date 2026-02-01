{ config, pkgs, lib, ... }:

{
  imports = [
    ../../../config/zsh/default.nix
  ];

  xdg.configFile."zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/zsh";
}
