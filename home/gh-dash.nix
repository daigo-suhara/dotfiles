{ config, ... }:

{
  # Keep the editable gh-dash configuration in the repository.
  xdg.configFile."gh-dash/config.yml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/gh-dash/config.yml";
    force = true;
  };
}
