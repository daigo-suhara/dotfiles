{ pkgs, inputs, lib, isDarwin, ... }:

let
  cica = import ./cica-font.nix { inherit pkgs; };
  wallpaperImage = ../../img/wallpaper.jpg;

  # macOS 26+ dropped osascript wallpaper support; use NSWorkspace instead.
  setWallpaperScript = pkgs.writeTextFile {
    name = "set-wallpaper.swift";
    text = ''
      import AppKit
      let url = URL(fileURLWithPath: "${wallpaperImage}")
      let screens = NSScreen.screens
      let workspace = NSWorkspace.shared
      for screen in screens {
        do {
          try workspace.setDesktopImageURL(url, for: screen, options: [:])
        } catch {
          print("Error: \(error)")
        }
      }
    '';
  };
in

{
  config = lib.mkMerge [
    {
      fonts.packages = [ cica ];

      stylix = {
        enable = true;
        image = wallpaperImage;
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
    (if isDarwin then {
      launchd.user.agents.set-wallpaper = {
        serviceConfig = {
          Label = "com.user.set-wallpaper";
          ProgramArguments = [ "/usr/bin/swift" "${setWallpaperScript}" ];
          RunAtLoad = true;
        };
      };
    } else {
      stylix.cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };
    })
  ];
}
