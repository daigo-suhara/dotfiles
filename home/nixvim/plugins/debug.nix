{ pkgs, ... }:

{
  extraPlugins = [ pkgs.vimPlugins.nvim-dap-view ];

  plugins = {
    dap.enable = true;
    dap-virtual-text.enable = true;
    dap-go.enable = true;
    neotest = {
      enable = true;
      adapters = {
        ctest.enable = true;
        go.enable = true;
        jest.enable = true;
        python.enable = true;
        rust.enable = true;
        vitest.enable = true;
      };
    };
  };
}
