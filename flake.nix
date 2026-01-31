{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      mkHome = { system, username, homeDirectory, stateVersion ? "23.11" }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
            {
              home.username = username;
              home.homeDirectory = homeDirectory;
              home.stateVersion = stateVersion;
            }
          ];
        };
    in
    {
      homeConfigurations = {
        # macOS (Apple Silicon)
        "suharadaigo" = mkHome {
          system = "aarch64-darwin";
          username = "suharadaigo";
          homeDirectory = "/Users/suharadaigo";
        };

        # Linux (Generic x86_64) - You can adjust this later
        "linux_user" = mkHome {
          system = "x86_64-linux";
          username = "suharadaigo";
          homeDirectory = "/home/suharadaigo";
        };
      };
    };
}
