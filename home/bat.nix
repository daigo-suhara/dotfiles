{ config, lib, pkgs, ... }:

{
  xdg.configFile."bat" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/bat";
    force = true;
  };

  home.activation.batThemeCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.bat}/bin/bat cache --build
  '';
}
