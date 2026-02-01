{ pkgs, inputs, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    cocoapods
    wezterm
    google-chrome
  ];

  # If you use nix-installer
  nix.enable = false;

  ids.gids.nixbld = 350;

  programs.zsh.enable = false;
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  users.users.daigo-suhara = {
    name = "daigo-suhara";
    home = "/Users/daigo-suhara";
  };
  system.primaryUser = "daigo-suhara";

  # Optional: Enable TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Dock
  system.defaults.dock = {
    orientation = "left";
    tilesize = 40;
    autohide = true;
    show-recents = false;
    mineffect = "scale";
    launchanim = true;
  };

  system.defaults.NSGlobalDomain = {
    ApplePressAndHoldEnabled = false;
    InitialKeyRepeat = 10;
    KeyRepeat = 1;
    "com.apple.swipescrolldirection" = true;
  };

  system.defaults.trackpad = {
    Clicking = true;
    TrackpadRightClick = true;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.dock" = {
      persistent-apps = [];
    };
  };

  # Finder
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };
}
