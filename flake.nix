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

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, stylix, ... }@inputs:
    let
      vars = import ./vars/default.nix;

      # Supported systems for apps/homeConfigurations
      supportedSystems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];

      # Helper to generate an attrset '{ "system" = f system; }' for each system
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Standard pkgs for a given system
      pkgsFor = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHome = { system, username, homeDirectory, stateVersion ? "23.11", platform ? "base" }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor system;
          extraSpecialArgs = { inherit vars; };
          modules = [
            ./home/${platform}/default.nix
            {
              home.username = username;
              home.homeDirectory = homeDirectory;
              home.stateVersion = stateVersion;
            }
          ];
        };
    in
    {
      apps = forAllSystems (system: {
        update = {
          type = "app";
          program = toString ((pkgsFor system).writeShellScript "update-script" ''
            set -e
            export NIX_CONFIG="experimental-features = nix-command flakes"

            OS=$(uname)

            echo "--- 1/3 Updating flake locks ---"
            nix flake update

            if [ "$OS" = "Darwin" ]; then
              echo "--- 2/3 Updating nix-darwin ---"
              sudo --preserve-env=NIX_CONFIG nix run nix-darwin -- switch --flake .#${vars.username}
            elif [ -f /etc/NIXOS ]; then
              echo "--- 2/3 Updating NixOS ---"
              sudo nixos-rebuild switch --flake .#nixos
            else
              echo "--- 2/3 Skipping system update (Unsupported OS) ---"
            fi

            echo "--- 3/3 Updating home-manager ---"
            if [ "$OS" = "Darwin" ]; then
              nix run home-manager -- switch --flake .#${vars.username}
            elif [ -f /etc/NIXOS ]; then
              echo "Home Manager update handled by nixos-rebuild"
            fi

            echo "Successfully updated everything!"
          '');
        };
      });
      darwinConfigurations."${vars.username}" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs vars; isDarwin = true; };
        modules = [
          ./hosts/darwin/macbook/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${vars.username}" = import ./home/darwin/default.nix;
            home-manager.extraSpecialArgs = { inherit vars; isDarwin = true; };
          }
        ];
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          # system is determined by hardware-configuration.nix or hostPlatform
          specialArgs = { inherit inputs vars; isDarwin = false; };
          modules = [
            ./hosts/nixos/generic/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.username}" = import ./home/linux/default.nix;
              home-manager.extraSpecialArgs = { inherit vars; isDarwin = false; };
            }
          ];
        };
      };

      homeConfigurations = {
        "${vars.username}" = mkHome {
          system = "aarch64-darwin";
          username = vars.username;
          homeDirectory = "/Users/${vars.username}";
          platform = "darwin";
        };

        # Linux (Generic x86_64)
        "linux-x86" = mkHome {
          system = "x86_64-linux";
          username = vars.username;
          homeDirectory = "/home/${vars.username}";
          platform = "linux";
        };

        # Linux (Generic aarch64)
        "linux-arm" = mkHome {
          system = "aarch64-linux";
          username = vars.username;
          homeDirectory = "/home/${vars.username}";
          platform = "linux";
        };
      };

    };
}
