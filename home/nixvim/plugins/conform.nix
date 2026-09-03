{ ... }:

{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = { lsp_fallback = true; async = false; timeout_ms = 1000; };
      formatters_by_ft = {
        lua = [ "stylua" ];
        go = [ "gofmt" ];
        cpp = [ "clang-format" ];
        json = [ "biome-check" ];
        javascript = [ "biome-check" ];
        javascriptreact = [ "biome-check" ];
        typescript = [ "biome-check" ];
        typescriptreact = [ "biome-check" ];
      };
    };
  };
}
