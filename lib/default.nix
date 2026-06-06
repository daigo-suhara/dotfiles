{ inputs, nixpkgs, home-manager, nix-darwin, vars }:

let
  supportedSystems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];

  forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

  pkgsFor = system: import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  mkHome = { system, username, homeDirectory, platform ? "base" }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {
        inherit inputs vars;
        isDarwin = (system == "aarch64-darwin");
      };
      modules = [
        ../home/${platform}/default.nix
        {
          home.username = username;
          home.homeDirectory = homeDirectory;
        }
      ];
    };

  mkNixos = system: nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs vars;
      isDarwin = false;
    };
    modules = [
      ../hosts/nixos/generic/default.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${vars.username}" = import ../home/linux/default.nix;
        home-manager.extraSpecialArgs = {
          inherit inputs vars;
          isDarwin = false;
        };
      }
    ];
  };

  mkDarwin = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = {
      inherit inputs vars;
      isDarwin = true;
    };
    modules = [
      ../hosts/darwin/macbook/default.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${vars.username}" = import ../home/darwin/default.nix;
        home-manager.extraSpecialArgs = {
          inherit inputs vars;
          isDarwin = true;
        };
      }
    ];
  };

  mkUpdateApp = system:
    let
      pkgs = pkgsFor system;
    in
    {
      type = "app";
      program = toString (pkgs.writeShellScript "update-script" ''
        set -e
        export NIX_CONFIG="experimental-features = nix-command flakes"

        OS=$(uname)
        ARCH=$(uname -m)

        echo "--- 1/3 Updating flake locks ---"
        nix flake update --quiet

        if [ "$OS" = "Darwin" ]; then
          echo "--- 2/3 Updating nix-darwin ---"
          sudo -H --preserve-env=NIX_CONFIG nix run nix-darwin -- switch --flake .#${vars.username} --impure
        elif [ -f /etc/NIXOS ]; then
          echo "--- 2/3 Updating NixOS ---"
          if [ "$ARCH" = "x86_64" ]; then
            sudo nixos-rebuild switch --flake .#nixos-x86 --impure
          elif [ "$ARCH" = "aarch64" ]; then
            sudo nixos-rebuild switch --flake .#nixos-arm --impure
          else
            sudo nixos-rebuild switch --flake .#nixos --impure
          fi
        else
          echo "--- 2/3 Skipping system update (Unsupported OS) ---"
        fi

        echo "--- 3/3 Updating home-manager ---"
        if [ "$OS" = "Darwin" ]; then
          echo "Home Manager update handled by nix-darwin"
        elif [ -f /etc/NIXOS ]; then
          echo "Home Manager update handled by nixos-rebuild"
        fi

        echo "Successfully updated everything!"
      '');
      meta.description = "Update flake inputs and rebuild the active system";
    };
in
{
  inherit supportedSystems forAllSystems pkgsFor mkHome mkNixos mkDarwin mkUpdateApp;
}
