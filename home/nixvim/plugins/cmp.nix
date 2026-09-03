{ ... }:

{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [ { name = "nvim_lsp"; } { name = "luasnip"; } { name = "buffer"; } { name = "path"; } ];
        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };
        completion.completeopt = "menu,menuone,preview,noselect";
        window.completion = { border = "rounded"; winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None"; };
        window.documentation = { border = "rounded"; winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,Search:None"; };
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
