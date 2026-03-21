{ config, pkgs, inputs, vars, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.stylix.nixosModules.stylix
    ../../../modules/nixos/default.nix
    ../../../modules/common/theme.nix
  ];

  networking.hostName = "nixos";

  # ブートローダー
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}
