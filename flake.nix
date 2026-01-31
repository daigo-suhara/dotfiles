{
  description = "Daigo Suhara's Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }@inputs:
    let
      system = "aarch64-darwin";
      username = "suharadaigo";
      pkgs = nixpkgs.legacyPackages.${system};
      mkHome = { system, username, homeDirectory, stateVersion ? "23.11" }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./modules/home-manager/default.nix
            {
              home.username = username;
              home.homeDirectory = homeDirectory;
              home.stateVersion = stateVersion;
            }
          ];
        };
    in
    {
      apps.${system}.update = {
        type = "app";
        program = toString (pkgs.writeShellScript "update-script" ''
          set -e
          export NIX_CONFIG="experimental-features = nix-command flakes"
          echo "Updating flake..."
          nix flake update
          echo "Updating nix-darwin..."
          sudo --preserve-env=NIX_CONFIG nix run nix-darwin -- switch --flake .#${username}
          echo "Update complete!"
        '');
      };

      darwinConfigurations."${username}" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/mac/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${username}" = import ./modules/home-manager/default.nix;
          }
        ];
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nixos/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${username}" = import ./modules/home-manager/default.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        "${username}" = mkHome {
          inherit system username;
          homeDirectory = "/Users/${username}";
        };

        # Linux (Generic x86_64)
        "linux" = mkHome {
          system = "x86_64-linux";
          username = "${username}";
          homeDirectory = "/home/${username}";
        };
      };
    };
}
