{ lib, ... }:

{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      cmdline.":" = {
        mapping = lib.nixvim.mkRaw ''
          cmp.mapping.preset.cmdline({
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
          })
        '';
        sources = [ { name = "path"; } { name = "cmdline"; } ];
      };
      settings = {
        sources = [ { name = "nvim_lsp"; } { name = "luasnip"; } { name = "buffer"; } { name = "path"; } ];
        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
          "<Tab>" = lib.nixvim.mkRaw ''cmp.mapping(function(fallback) if not require("luasnip").jump(1) then fallback() end end, { "i", "s" })'';
          "<S-Tab>" = lib.nixvim.mkRaw ''cmp.mapping(function(fallback) if not require("luasnip").jump(-1) then fallback() end end, { "i", "s" })'';
        };
        completion.completeopt = "menu,menuone,preview,noselect";
        window.completion = { border = "rounded"; winhighlight = "Normal:CmpNormal,CursorLine:PmenuSel,Search:None"; };
        window.documentation = { border = "rounded"; winhighlight = "Normal:CmpNormal,Search:None"; };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    luasnip.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
