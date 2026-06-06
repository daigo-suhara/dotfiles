{ pkgs, inputs, lib, isDarwin, ... }:

let
  cica = import ./cica-font.nix { inherit pkgs; };
in

{
  config = lib.mkMerge [
    {
      fonts.packages = [ cica ];

      stylix = {
        enable = true;
        image = ../../img/wallpaper.jpg;
        base16Scheme = "${inputs.stylix.inputs.tinted-schemes}/base16/catppuccin-mocha.yaml";
        
        # Consistent theme settings
        opacity.terminal = 0.9;
        
        fonts = {
          monospace = {
            package = cica;
            name = "Cica";
          };
          sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
          };
          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };
        };
      };
    }
    # Completely avoid mentioning 'stylix.cursor' for darwin hosts to resolve "option does not exist" errors.
    (if isDarwin then {} else {
      stylix.cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };
    })
  ];
}
