{ config, ... }:

{
  # Keep the editable Yazi configuration linked from this repository.
  xdg.configFile."yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/yazi";
}
