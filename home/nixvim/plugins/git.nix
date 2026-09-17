{ pkgs, ... }:

{
  plugins = {
    gitsigns.enable = true;
    lazygit.enable = true;
  };

  extraPlugins = [ pkgs.vimPlugins.lazydocker-nvim ];
  extraConfigLua = "require('lazydocker').setup()";
}
