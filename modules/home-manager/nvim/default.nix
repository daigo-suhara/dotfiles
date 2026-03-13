{ config, pkgs, lib, ... }:

{
  imports = [
    ./packages.nix
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
}
