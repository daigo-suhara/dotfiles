{ pkgs, ... }:

{
  imports = [
    ../base
    ./gnome.nix
  ];

  # Linux-specific Home Manager settings
  home.packages = with pkgs; [
    # libnotify # Example
  ];
}
