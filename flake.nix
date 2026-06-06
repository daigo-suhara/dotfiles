{
  description = "Daigo Suhara's Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:nix-community/stylix/release-25.11";
  };

  outputs = { nixpkgs, home-manager, nix-darwin, ... }@inputs:
    let
      vars = import ./vars/default.nix;
      helpers = import ./lib {
        inherit inputs nixpkgs home-manager nix-darwin vars;
      };
    in
    {
      apps = helpers.forAllSystems (system: {
        update = helpers.mkUpdateApp system;
      });

      darwinConfigurations."${vars.username}" = helpers.mkDarwin;

      nixosConfigurations = {
        nixos-x86 = helpers.mkNixos "x86_64-linux";
        nixos-arm = helpers.mkNixos "aarch64-linux";
        nixos = helpers.mkNixos "aarch64-linux";
      };

      homeConfigurations = {
        "${vars.username}" = helpers.mkHome {
          system = "aarch64-darwin";
          username = vars.username;
          homeDirectory = "/Users/${vars.username}";
          platform = "darwin";
        };

        # Linux (Generic x86_64)
        "linux-x86" = helpers.mkHome {
          system = "x86_64-linux";
          username = vars.username;
          homeDirectory = "/home/${vars.username}";
          platform = "linux";
        };

        # Linux (Generic aarch64)
        "linux-arm" = helpers.mkHome {
          system = "aarch64-linux";
          username = vars.username;
          homeDirectory = "/home/${vars.username}";
          platform = "linux";
        };
      };

    };
}
