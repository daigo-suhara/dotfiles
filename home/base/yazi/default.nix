{ config, ... }:

{
  xdg.configFile."yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/yazi";
}
