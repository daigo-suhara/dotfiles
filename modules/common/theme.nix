{ pkgs, inputs, lib, isDarwin, ... }:

{
  config = lib.mkMerge [
    {
      stylix = {
        enable = true;
        image = ../../img/wallpaper.jpg;
        base16Scheme = "${inputs.stylix.inputs.tinted-schemes}/base16/catppuccin-mocha.yaml";
        
        # Consistent theme settings
        opacity.terminal = 0.9;
        
        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font";
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
