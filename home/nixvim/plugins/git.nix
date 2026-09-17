{ pkgs, ... }:

{
  plugins = {
    gitsigns.enable = true;
    octo = {
      enable = true;
      settings.picker = "snacks";
    };
  };

  extraPlugins = [ pkgs.vimPlugins.lazydocker-nvim ];
  extraConfigLua = "require('lazydocker').setup()";
}
