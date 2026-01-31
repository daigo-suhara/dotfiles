{ pkgs, inputs, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    cocoapods
    wezterm
    google-chrome
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  ids.gids.nixbld = 350;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

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

  users.users.suharadaigo = {
    name = "suharadaigo";
    home = "/Users/suharadaigo";
  };

  # Set the primary user for nix-darwin (required for homebrew)
  system.primaryUser = "suharadaigo";

  # Optional: Enable TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
