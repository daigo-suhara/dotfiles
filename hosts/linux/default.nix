{ pkgs, ... }:

{
  system.stateVersion = "23.11";

  environment.systemPackages = with pkgs; [
    wezterm
    google-chrome
  ]
}

