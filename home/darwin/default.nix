{ pkgs, ... }:

{
  imports = [
    ../base
  ];

  # macOS-specific Home Manager settings
  home.packages = with pkgs; [
    # raycast # Example
  ];
}
