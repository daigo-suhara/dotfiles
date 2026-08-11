{ config, ... }:

{
  # Keep the editable WezTerm configuration linked from this repository.
  xdg.configFile."wezterm".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/wezterm";
}
