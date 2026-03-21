{ pkgs, ... }:

{
  imports = [
    ../base
  ];

  # Linux-specific Home Manager settings
  home.packages = with pkgs; [
    # libnotify # Example
  ];
}
