{ pkgs, inputs, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    cocoapods
    wezterm
    google-chrome
    slack
    zoom-us
    colima
  ];

  # If you use nix-installer
  nix.enable = false;

  programs.zsh.enable = true;

  ids.gids.nixbld = 350;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  users.users.daigo-suhara = {
    name = "daigo-suhara";
    home = "/Users/daigo-suhara";
  };
  system.primaryUser = "daigo-suhara";

  # Optional: Enable TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

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
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    "com.apple.swipescrolldirection" = false;
  };

  system.defaults.trackpad = {
    Clicking = true;
    TrackpadRightClick = true;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.dock" = {
      persistent-apps = [];
    };
    "com.apple.WindowManager" = {
      StandardHideWidgets = true;
    };
    "com.apple.inputmethod.Kotoeri" = {
        JIMPrefPunctuationTypeKey = 3;
    };
  };

  # Finder
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    ShowPathbar = true;
    ShowStatusBar = true;
    QuitMenuItem = true;
  };

  system.activationScripts.postActivation.text = ''
    echo "setting wallpaper..."
    sudo -u daigo-suhara osascript -e 'tell application "Finder" to set desktop picture to POSIX file "${../../img/wallpaper.jpg}"'
  '';
}
