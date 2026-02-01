{ pkgs, inputs, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    cocoapods
    wezterm
    google-chrome
    gemini-cli
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

  fonts.packages = with pkgs; [
    (runCommand "cica-font" {
        src = fetchzip {
          url = "https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip";
          sha256 = "08yr7accwih7k37z8d19rfg8ha3j7illl5npy92d63wzc1yygl06";
          stripRoot = false;
        };
      } ''
        mkdir -p $out/share/fonts/truetype
        cp $src/*.ttf $out/share/fonts/truetype/
      '')
  ];

  users.users.daigo-suhara = {
    name = "daigo-suhara";
    home = "/Users/daigo-suhara";
  };

  # Set the primary user for nix-darwin (required for homebrew)
  system.primaryUser = "daigo-suhara";

  # Optional: Enable TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
