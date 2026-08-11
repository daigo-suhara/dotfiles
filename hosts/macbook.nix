{ pkgs, inputs, user, ... }:

let
  cica = import ../cica-font.nix { inherit pkgs; };
  wallpaperImage = ../img/wallpaper.jpg;
  setWallpaperScript = pkgs.writeTextFile {
    name = "set-wallpaper.swift";
    text = ''
      import AppKit
      let url = URL(fileURLWithPath: "${wallpaperImage}")
      let workspace = NSWorkspace.shared
      for screen in NSScreen.screens {
        try? workspace.setDesktopImageURL(url, for: screen, options: [:])
      }
    '';
  };
in
{
  imports = [
    inputs.stylix.darwinModules.stylix
  ];

  fonts.packages = [ cica ];

  stylix = {
    enable = true;
    image = wallpaperImage;
    base16Scheme = "${inputs.stylix.inputs.tinted-schemes}/base16/catppuccin-mocha.yaml";
    opacity.terminal = 0.9;
    fonts = {
      monospace = {
        package = cica;
        name = "Cica";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };

  launchd.user.agents.set-wallpaper = {
    serviceConfig = {
      Label = "com.user.set-wallpaper";
      ProgramArguments = [ "/usr/bin/swift" "${setWallpaperScript}" ];
      RunAtLoad = true;
    };
  };

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
    onActivation.extraFlags = [ "--force-cleanup" ];
    casks = [
      "autodesk-fusion"
      "flutter"
      "google-chrome"
      "slack"
      "discord"
      "visual-studio-code"
      "adobe-creative-cloud"
      "docker-desktop"
      "codex"
      "android-studio"
      "bambu-studio"
    ];
  };

  users.users."${user.username}" = {
    name = user.username;
    home = "/Users/${user.username}";
  };
  system.primaryUser = user.username;

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
      EnableStandardClickToShowDesktop = false;
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
