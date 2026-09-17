{ pkgs, ... }:

{
  extraPlugins = [ pkgs.vimPlugins.nvim-dap-view ];

  plugins = {
    dap.enable = true;
    dap-virtual-text.enable = true;
    dap-go.enable = true;
  };
}
