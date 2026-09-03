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

    stylix.url = "github:nix-community/stylix/release-25.11";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
    };
  };

  outputs = { nixpkgs, home-manager, nix-darwin, ... }@inputs:
    let
      user = import ./user.nix;
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };
    in
    {
      darwinConfigurations."${user.username}" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs user; };
        modules = [
          ./hosts/macbook.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${user.username}" = import ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs user; };
          }
        ];
      };

      apps.aarch64-darwin.update = {
        type = "app";
        program = toString (pkgs.writeShellScript "update" ''
          set -e
          export NIX_CONFIG="experimental-features = nix-command flakes"
          nix flake update --quiet
          sudo -H --preserve-env=NIX_CONFIG nix run nix-darwin -- switch --flake .#${user.username} --impure
        '');
        meta.description = "Update flake inputs and rebuild macOS";
      };
    };
}
