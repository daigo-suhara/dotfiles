{ pkgs, inputs, ... }:

let
  vars = import ../../../vars/default.nix;
in
{
  imports = [
    inputs.stylix.darwinModules.stylix
    ../../../modules/common/theme.nix
  ];

  environment.systemPackages = with pkgs; [
    cocoapods
    wezterm
  ];

  # If you use nix-installer
  nix.enable = false;

  programs.zsh.enable = true;

  ids.gids.nixbld = 350;

  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "autodesk-fusion"
      "docker-desktop"
      "google-chrome"
      "slack"
    ];
  };

  users.users."${vars.username}" = {
    name = vars.username;
    home = "/Users/${vars.username}";
  };
  system.primaryUser = vars.username;

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

}
