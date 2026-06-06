{ pkgs, ... }:

let
  cica = import ../../modules/common/cica-font.nix { inherit pkgs; };
in

{
  imports = [
    ../base
  ];

  # Make the Cica font visible to CoreText-backed apps like WezTerm.
  home.file."Library/Fonts/Cica".source = "${cica}/share/fonts/truetype/cica";

  home.stateVersion = "23.11";
}
