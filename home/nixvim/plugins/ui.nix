{ ... }:

{
  plugins = {
    web-devicons.enable = true;
    which-key = {
      enable = true;
      settings = {
        triggers = [ { __unkeyed-1 = "<auto>"; mode = "n"; } ];
        spec = [
          { __unkeyed-1 = "<leader>d"; group = "Document"; }
          { __unkeyed-1 = "<leader>f"; group = "Find"; }
          { __unkeyed-1 = "<leader>g"; group = "GitHub"; }
          { __unkeyed-1 = "<leader>l"; group = "Tools"; }
          { __unkeyed-1 = "<leader>s"; group = "Window"; }
        ];
      };
    };
    fidget.enable = true;
    colorizer = { enable = true; settings.user_default_options = { RGB = true; RRGGBB = true; names = false; RRGGBBAA = false; rgb_fn = false; hsl_fn = false; css = false; css_fn = false; mode = "background"; }; };
    transparent = { enable = true; settings = { groups = [ "Normal" "NormalNC" "Comment" "Constant" "Special" "Identifier" "Statement" "PreProc" "Type" "Underlined" "Todo" "String" "Function" "Conditional" "Repeat" "Operator" "Structure" "LineNr" "NonText" "SignColumn" "CursorLine" "CursorLineNr" "StatusLine" "StatusLineNC" "EndOfBuffer" "BufferLineFill" "BufferLineBackground" ]; extra_groups = [ "NormalFloat" "FloatBorder" "Pmenu" "CmpNormal" "TermNormal" "TermNormalNC" ]; }; };
  };
}
